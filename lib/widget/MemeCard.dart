import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:memestream/constants/colors.dart';
import '../domain/entities/meme.dart';
import '../presentation/screen/meme_detail_screen.dart';
import 'SourceBadge.dart';

class MemeCard extends StatelessWidget {
  final Meme meme;

  const MemeCard({super.key, required this.meme});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MemeDetailScreen(meme: meme),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: AspectRatio(
          aspectRatio: 358 / 535, // 요청하신 비율 적용
          child: Card(
            margin: EdgeInsets.zero, // Padding으로 대체
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: CachedNetworkImage(
                          imageUrl: meme.imageUrl,
                          fit: BoxFit.cover,
                          memCacheWidth: 800,
                          placeholder: (context, url) => Container(
                            color: Colors.grey.withValues(alpha: 0.1),
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          errorWidget: (context, url, error) => const Center(
                            child: Icon(
                              Icons.broken_image,
                              size: 50,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 12,
                        left: 12,
                        child: SourceBadge(source: meme.source),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  tileColor: AppColors.surfaceDark,
                  title: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      meme.title,
                      style: const TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
