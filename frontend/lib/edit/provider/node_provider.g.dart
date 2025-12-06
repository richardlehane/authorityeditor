// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Node)
const nodeProvider = NodeProvider._();

final class NodeProvider
    extends $NotifierProvider<Node, authority.CurrentNode> {
  const NodeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nodeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nodeHash();

  @$internal
  @override
  Node create() => Node();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(authority.CurrentNode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<authority.CurrentNode>(value),
    );
  }
}

String _$nodeHash() => r'ccc503c6ee9e2d747cb399a46f8a6aab11a218ed';

abstract class _$Node extends $Notifier<authority.CurrentNode> {
  authority.CurrentNode build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<authority.CurrentNode, authority.CurrentNode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<authority.CurrentNode, authority.CurrentNode>,
              authority.CurrentNode,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
