import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'AppConfig.dart';
import 'presentation/screen/meme_list_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url:AppConfig.supabaseUrl,
    anonKey:AppConfig.supabaseAnonKey
  );

  runApp(
    const ProviderScope(
      child:MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'MemeStream',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      
      // 다크 모드 지원 (시스템 설정에 따라 자동 전환)
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),

      // 4. 앱의 첫 관문을 우리가 만든 밈 리스트 화면으로 설정합니다.
      home: const MemeListScreen(),

    );
  }
}

