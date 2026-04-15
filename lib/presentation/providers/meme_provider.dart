import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Ref 사용을 위해 추가
import '../../data/repositories/meme_repository_impl.dart';
import '../../domain/entities/meme.dart';
import '../../domain/repositories/meme_repository.dart';
import '../../services/meme_service.dart';

part 'meme_provider.g.dart';

@riverpod
SupabaseClient supabaseClient(Ref ref){
    return Supabase.instance.client;
}

@riverpod
MemeRepository memeRepository(Ref ref){
    final client = ref.watch(supabaseClientProvider);
    return MemeRepositoryImpl(client);
}

@riverpod
MemeService memeService(Ref ref){
    final repository = ref.watch(supabaseClientProvider);
    return MemeService(repository);
}

@riverpod
class MemeList extends _$MemeList{
    @override
    Future<List<Meme>> build() async{
        return ref.watch(memeServiceProvider).getLatestMemes();
    }

    Future<void> refresh() async{
        state = const AsyncLoading();
        state = await AsyncValue.guard(()=>ref.read(memeServiceProvider).getLatestMemes());
    }
}