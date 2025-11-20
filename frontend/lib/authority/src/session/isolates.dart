import 'dart:async';
import 'dart:isolate';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import '../../authority.dart';

import 'bindings.dart';
import 'tree.dart';

class Session {
  final Future<SendPort> futureSendPort = _helperIsolateSendPort;
  SendPort? helperIsolateSendPort;

  Future<void> init() async {
    await futureSendPort.then(
      ((value) => helperIsolateSendPort = value),
      onError: (err) => print(err),
    );
  }

  Future<int> load(String path) async {
    final int requestId = _nextRequestId++;
    final _LoadRequest request = _LoadRequest(requestId, path);
    final Completer<int> completer = Completer<int>();
    _Requests[requestId] = completer;
    helperIsolateSendPort?.send(request);
    return completer.future;
  }

  Future<bool> valid(int index) async {
    final int requestId = _nextRequestId++;
    final _ValidRequest request = _ValidRequest(requestId, index);
    final Completer<bool> completer = Completer<bool>();
    _Requests[requestId] = completer;
    helperIsolateSendPort?.send(request);
    return completer.future;
  }

  Future<String> asString(int index) async {
    final int requestId = _nextRequestId++;
    final _AsStringRequest request = _AsStringRequest(requestId, index);
    final Completer<String> completer = Completer<String>();
    _Requests[requestId] = completer;
    helperIsolateSendPort?.send(request);
    return completer.future;
  }

  Future<List<TreeNode>> tree(int index) async {
    final int requestId = _nextRequestId++;
    final _TreeRequest request = _TreeRequest(requestId, index);
    final Completer<List<TreeNode>> completer = Completer<List<TreeNode>>();
    _Requests[requestId] = completer;
    helperIsolateSendPort?.send(request);
    return completer.future;
  }
}

class _LoadRequest {
  final int id;
  final String path;
  const _LoadRequest(this.id, this.path);
}

class _LoadResponse {
  final int id;
  final int result;
  const _LoadResponse(this.id, this.result);
}

class _ValidRequest {
  final int id;
  final int idx;
  const _ValidRequest(this.id, this.idx);
}

class _ValidResponse {
  final int id;
  final bool result;
  const _ValidResponse(this.id, this.result);
}

class _AsStringRequest {
  final int id;
  final int idx;
  const _AsStringRequest(this.id, this.idx);
}

class _AsStringResponse {
  final int id;
  final String result;
  const _AsStringResponse(this.id, this.result);
}

class _TreeRequest {
  final int id;
  final int idx;
  const _TreeRequest(this.id, this.idx);
}

class _TreeResponse {
  final int id;
  final List<TreeNode> result;
  const _TreeResponse(this.id, this.result);
}

int _nextRequestId = 0;

/// Mapping from [_SumRequest] `id`s to the completers corresponding to the correct future of the pending request.
final Map<int, Completer> _Requests = <int, Completer>{};

/// The SendPort belonging to the helper isolate.
Future<SendPort> _helperIsolateSendPort = () async {
  // The helper isolate is going to send us back a SendPort, which we want to
  // wait for.
  final Completer<SendPort> sendCompleter = Completer<SendPort>();

  // Receive port on the main isolate to receive messages from the helper.
  // We receive two types of messages:
  // 1. A port to send messages on.
  // 2. Responses to requests we sent.
  final ReceivePort receivePort =
      ReceivePort()..listen((dynamic data) {
        if (data is SendPort) {
          // The helper isolate sent us the port on which we can sent it requests.
          sendCompleter.complete(data);
          return;
        }
        switch (data.runtimeType) {
          case _LoadResponse:
          case _ValidResponse:
          case _AsStringResponse:
          case _TreeResponse:
            final Completer completer = _Requests[data.id]!;
            _Requests.remove(data.id);
            completer.complete(data.result);
            return;
          default:
            throw UnsupportedError(
              'Unsupported message type: ${data.runtimeType}',
            );
        }
      });

  // Start the helper isolate.
  await Isolate.spawn((SendPort sendPort) async {
    final _bindings = Bindings();

    final ReceivePort helperReceivePort =
        ReceivePort()..listen((dynamic data) {
          // On the helper isolate listen to requests and respond to them.
          switch (data.runtimeType) {
            case _LoadRequest:
              final String pstr = data.path;
              final Pointer<Utf8> p = pstr.toNativeUtf8();
              final int result = _bindings.load(p);
              malloc.free(p);
              final _LoadResponse response = _LoadResponse(data.id, result);
              sendPort.send(response);
              return;
            case _ValidRequest:
              final bool result = _bindings.valid(data.idx);
              final _ValidResponse response = _ValidResponse(data.id, result);
              sendPort.send(response);
              return;
            case _AsStringRequest:
              final messageUtf8 = _bindings.asStr(data.idx);
              final message = messageUtf8.toDartString();
              _bindings.freeStr(messageUtf8);
              final _AsStringResponse response = _AsStringResponse(
                data.id,
                message,
              );
              sendPort.send(response);
              return;
            case _TreeRequest:
              final payload = _bindings.tree(data.idx);
              final message = asTree(
                payload.data.asTypedList(payload.length),
                Counter(),
              );
              final _TreeResponse response = _TreeResponse(data.id, message);
              sendPort.send(response);
              return;
            default:
              throw UnsupportedError(
                'Unsupported message type: ${data.runtimeType}',
              );
          }
        });

    // Send the port to the main isolate on which we can receive requests.
    sendPort.send(helperReceivePort.sendPort);
  }, receivePort.sendPort);

  // Wait until the helper isolate has sent us back the SendPort on which we
  // can start sending requests.
  return sendCompleter.future;
}();
