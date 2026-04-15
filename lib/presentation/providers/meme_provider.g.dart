// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meme_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(supabaseClient)
final supabaseClientProvider = SupabaseClientProvider._();

final class SupabaseClientProvider
    extends $FunctionalProvider<SupabaseClient, SupabaseClient, SupabaseClient>
    with $Provider<SupabaseClient> {
  SupabaseClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'supabaseClientProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$supabaseClientHash();

  @$internal
  @override
  $ProviderElement<SupabaseClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SupabaseClient create(Ref ref) {
    return supabaseClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SupabaseClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SupabaseClient>(value),
    );
  }
}

String _$supabaseClientHash() => r'36e9cae00709545a85bfe4a5a2cb98d8686a01ea';

@ProviderFor(memeRepository)
final memeRepositoryProvider = MemeRepositoryProvider._();

final class MemeRepositoryProvider
    extends $FunctionalProvider<MemeRepository, MemeRepository, MemeRepository>
    with $Provider<MemeRepository> {
  MemeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'memeRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$memeRepositoryHash();

  @$internal
  @override
  $ProviderElement<MemeRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MemeRepository create(Ref ref) {
    return memeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MemeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MemeRepository>(value),
    );
  }
}

String _$memeRepositoryHash() => r'078545d5d9e50890951d435300a6140f950b65d1';

@ProviderFor(memeService)
final memeServiceProvider = MemeServiceProvider._();

final class MemeServiceProvider
    extends $FunctionalProvider<MemeService, MemeService, MemeService>
    with $Provider<MemeService> {
  MemeServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'memeServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$memeServiceHash();

  @$internal
  @override
  $ProviderElement<MemeService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MemeService create(Ref ref) {
    return memeService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MemeService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MemeService>(value),
    );
  }
}

String _$memeServiceHash() => r'2257c4f18e6839184715ed0e93356f63b6b98d6b';

@ProviderFor(MemeList)
final memeListProvider = MemeListProvider._();

final class MemeListProvider
    extends $AsyncNotifierProvider<MemeList, List<Meme>> {
  MemeListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'memeListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$memeListHash();

  @$internal
  @override
  MemeList create() => MemeList();
}

String _$memeListHash() => r'a55430e4d3fa49fe5af48149a6b6ac01a7f9c5dc';

abstract class _$MemeList extends $AsyncNotifier<List<Meme>> {
  FutureOr<List<Meme>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Meme>>, List<Meme>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Meme>>, List<Meme>>,
              AsyncValue<List<Meme>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
