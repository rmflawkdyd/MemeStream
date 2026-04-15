class Meme{
    final String id;
    final String title;
    final String author;
    final String source;
    final String type;
    final String imageUrl;
    final String? mediaUrl;
    final String? sourceUrl;

    Meme({
        required this.id,
        required this.title,
        required this.author,
        required this.source,
        required this.type,
        required this.imageUrl,
        this.mediaUrl,
        required this.sourceUrl
    });
}