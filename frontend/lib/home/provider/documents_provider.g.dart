// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documents_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$documentsHash() => r'd7ab7cd3627126afbfa38db9b39d0d9db8577391';

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
