import '../entities/meme.dart';

abstract class MemeRepository {
  Future<List<Meme>> getMemes();
}
