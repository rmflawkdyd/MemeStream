import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memestream/presentation/screen/meme_detail_screen.dart';
import 'package:memestream/widget/MemeCard.dart';
import '../../constants/colors.dart';
import '../../widget/GradientText.dart';
import '../providers/meme_provider.dart';

class MemeListScreen extends ConsumerWidget {
  const MemeListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memeListAsync = ref.watch(memeListProvider);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const GradientText(
          'MEMESTREAM',
          style: TextStyle(fontSize: 24),
          gradient: LinearGradient(
            colors: [
              AppColors.lightOrchid,
              AppColors.vividViolet,
            ],
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white, // 원하는 색상으로 지정
        ),
        actions: [
          IconButton(
            onPressed: () => ref.read(memeListProvider.notifier).refresh(),
            icon: const Icon(Icons.refresh,color: Colors.white),
          ),
        ],
        backgroundColor: AppColors.appBarColor,
        scrolledUnderElevation: 0,
      ),
      body: memeListAsync.when(
        data: (memes) => RefreshIndicator(
          onRefresh: () => ref.read(memeListProvider.notifier).refresh(),
          child: ListView.builder(
            cacheExtent: MediaQuery.of(context).size.height * 2,
            itemCount: memes.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                // 첫 번째 아이템으로 'Meme Feed' 텍스트 배치
                return const Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Text(
                    'Meme Feed',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                );
              }
              final meme = memes[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MemeDetailScreen(meme: meme),
                    ),
                  );
                },
                child: MemeCard(meme: meme,)
              );
            },
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error',style: TextStyle(color: Colors.white),)),
      ),
    );
  }
}
