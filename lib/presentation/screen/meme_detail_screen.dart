import 'package:flutter/material.dart';
import 'package:memestream/domain/entities/meme.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../constants/colors.dart';
import '../../widget/GradientText.dart';

class MemeDetailScreen extends StatefulWidget {
  final Meme meme;
  const MemeDetailScreen({super.key, required this.meme});

  @override
  State<MemeDetailScreen> createState() => _MemeDetailScreenState();
}

class _MemeDetailScreenState extends State<MemeDetailScreen> {
  late YoutubePlayerController _controller;
  bool _isYoutube = false;

  @override
  void initState() {
    super.initState();
    // 유튜브 소스인지 확인 (mediaUrl이 존재하고 소스가 YouTube인 경우)
    _isYoutube = widget.meme.source == 'YouTube' && widget.meme.mediaUrl != null;

    if (_isYoutube) {
      _controller = YoutubePlayerController(
        initialVideoId: widget.meme.mediaUrl!,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          isLive: false,
          forceHD: false,
        ),
      );
    }
  }

  @override
  void dispose() {
    if (_isYoutube) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const GradientText(
          'MEMESTREAM',
          style: TextStyle(fontSize: 24),
          gradient: LinearGradient(
            colors: [AppColors.lightOrchid, AppColors.vividViolet],
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white, // 원하는 색상으로 지정
        ),
        actions: [
          IconButton(
            onPressed: () {
              SharePlus.instance.share(
                ShareParams(
                  text: '${widget.meme.title}\n${widget.meme.imageUrl}',
                ),
              );
            },
            icon: const Icon(Icons.share, color: Colors.white),
          ),
        ],
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: _isYoutube
                    ? YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: AppColors.vividViolet,
                      )
                    : InteractiveViewer(
                        child: Image.network(
                          widget.meme.imageUrl,
                          fit: BoxFit.contain,
                          alignment: Alignment.bottomCenter,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(child: CircularProgressIndicator());
                          },
                        ),
                      ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.meme.title,
                    style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Source: ${widget.meme.source} | @${widget.meme.author}",
                    style: TextStyle(color: Colors.white.withValues(alpha: 0.7)),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => _launchURL(widget.meme.sourceUrl),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.brightLavender,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.open_in_new, color: AppColors.deepIndigo,size: 20,),
                          SizedBox(width: 12,),
                          Text(
                            '원본 페이지로 이동',
                            style: TextStyle(
                              color: AppColors.deepIndigo,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _launchURL(String? url) async {
    if (url == null) return;
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }
}
