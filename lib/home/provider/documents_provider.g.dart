// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documents_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(Documents)
const documentsProvider = DocumentsProvider._();

final class DocumentsProvider extends $NotifierProvider<Documents, DocState> {
  const DocumentsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'documentsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$documentsHash();

  @$internal
  @override
  Documents create() => Documents();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DocState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DocState>(value),
    );
  }
}

String _$documentsHash() => r'52941cfb20fc2ea01737a67c3d696c209bbd38fd';

abstract class _$Documents extends $Notifier<DocState> {
  DocState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<DocState, DocState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DocState, DocState>,
              DocState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
