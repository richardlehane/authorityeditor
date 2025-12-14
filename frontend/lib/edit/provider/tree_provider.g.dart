// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Tree)
const treeProvider = TreeProvider._();

final class TreeProvider extends $NotifierProvider<Tree, List<TreeViewItem>> {
  const TreeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'treeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$treeHash();

  @$internal
  @override
  Tree create() => Tree();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<TreeViewItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<TreeViewItem>>(value),
    );
  }
}

String _$treeHash() => r'69374d208c3b749c42d54a9289d1bc70c7ec0f4a';

abstract class _$Tree extends $Notifier<List<TreeViewItem>> {
  List<TreeViewItem> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<TreeViewItem>, List<TreeViewItem>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<TreeViewItem>, List<TreeViewItem>>,
              List<TreeViewItem>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
