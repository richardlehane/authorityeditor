// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(Node)
const nodeProvider = NodeProvider._();

final class NodeProvider extends $NotifierProvider<Node, CurrentNode> {
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
  Override overrideWithValue(CurrentNode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CurrentNode>(value),
    );
  }
}

String _$nodeHash() => r'ed938adac9df0b8058c0f46467cf8959b54531ed';

abstract class _$Node extends $Notifier<CurrentNode> {
  CurrentNode build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CurrentNode, CurrentNode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CurrentNode, CurrentNode>,
              CurrentNode,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
