import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../data/models/meme_model.dart';
import '../domain/entities/meme.dart';
import '../domain/repositories/meme_repository.dart';



class MemeService{
  final SupabaseClient _repository;
  MemeService(this._repository);

  // Isolate에서 실행될 파싱 함수
  static List<Meme> _parseMemes(List<dynamic> data) {
    return data.map((json) => MemeModel.fromJson(json as Map<String, dynamic>)).toList();
  }

  Future<List<Meme>> getLatestMemes() async {
    final response = await _repository
        .from('memes')
        .select()
        .order('created_at', ascending: false);

    // 무거운 JSON 매핑 작업을 별도 Isolate로 분리
    return await compute(_parseMemes, response as List<dynamic>);
  }
}