import 'dart:io';
import 'dart:ui';
import 'package:authorityeditor/home/provider/documents_provider.dart';
import 'package:file_picker/file_picker.dart' show PlatformFile;
import 'package:path/path.dart' as path;
import 'package:logging/logging.dart';
import 'package:flutter/foundation.dart' as foundation;
import "package:flutter/services.dart";
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authorityeditor/home/view/home.dart';
import 'package:authorityeditor/authority/authority.dart' show outputDir;

final log = Logger('AuthorityEditor');

void main(List<String> args) async {
  if (foundation.kIsWeb) {
    WidgetsFlutterBinding.ensureInitialized();
    BrowserContextMenu.disableContextMenu();
  } else {
    Directory dir;
    try {
      dir = await Directory(outputDir).create(recursive: true);
    } catch (e) {
      log.severe('Failed to open/create temp directory:\n $e');
      exit(1);
    }
    // clear temp files, ignoring any errors
    await for (var entity in dir.list()) {
      entity.delete(recursive: true);
    }
  }
  final arg = (args.isNotEmpty) ? args[0] : null;
  runApp(ProviderScope(child: MyApp(arg)));
}

class MyApp extends StatelessWidget {
  final String? arg;
  const MyApp(this.arg, {super.key});

  @override
  Widget build(BuildContext context) {
    return _EagerInitialization(child: AEApp(arg));
  }
}

class _EagerInitialization extends ConsumerWidget {
  const _EagerInitialization({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(documentsProvider);
    return child;
  }
}

class AEApp extends ConsumerStatefulWidget {
  const AEApp(this.arg, {super.key});
  final String? arg;
  @override
  ConsumerState<AEApp> createState() => _AEAppState();
}

class _AEAppState extends ConsumerState<AEApp> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    _listener = AppLifecycleListener(
      onExitRequested: () async {
        return AppExitResponse.exit;
      },
    );
    if (widget.arg != null) {
      ref
          .read(documentsProvider.notifier)
          .load(
            PlatformFile(
              name: path.basename(widget.arg!),
              path: widget.arg,
              size: 0,
            ),
          );
    }
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Authority Editor',
      home: const HomePage(),
      theme: FluentThemeData(
        brightness: Brightness.light,
        accentColor: Colors.orange,
      ),
    );
  }
}
