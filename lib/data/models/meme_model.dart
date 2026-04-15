import '../../domain/entities/meme.dart';

class MemeModel extends Meme{
    MemeModel({
        required String id,
        required String title,
        required String author,
        required String source,
        required String type,
        required String imageUrl,
        String? mediaUrl,
        required String? sourceUrl
    }):super(
        id:id,
        title:title,
        author: author,
        source: source,
        type: type,
        imageUrl:imageUrl,
        mediaUrl:mediaUrl,
        sourceUrl:sourceUrl
    );

    factory MemeModel.fromJson(Map<String,dynamic>json){
        return MemeModel(
            id: json['origin_id'],
            title: json['title'] ?? '제목 없음',
            author: json['author'] ?? '익명',
            source: json['source'] ?? 'Unknown',
            type: json['type'] ?? 'IMAGE',
            imageUrl: json['image_url'] ?? '',
            mediaUrl: json['media_url'],
            sourceUrl: json['source_url'] ?? '',
        );
    }

    Map<String,dynamic> toJson(){
        return {
            'title':title,
            'image_url':imageUrl,
            'source':source
        };
    }
}