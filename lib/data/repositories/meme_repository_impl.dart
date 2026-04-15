import '../../domain/entities/meme.dart';
import '../../domain/repositories/meme_repository.dart';
import '../models/meme_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MemeRepositoryImpl implements MemeRepository{
    final SupabaseClient _client;

    MemeRepositoryImpl(this._client);
    
    @override
    Future<List<Meme>> getMemes() async {
        try{
            final response = await _client
            .from('memes')
            .select()
            .order('created_at',ascending:false);

            final List<dynamic> data = response as List<dynamic>;

            return data.map((json)=> MemeModel.fromJson(json)).toList();
        }catch(e){
            throw Exception('데이터를 가져오지 못했습니다: $e');
        }
    }
}