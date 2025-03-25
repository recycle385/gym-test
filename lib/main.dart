import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view/main_screen.dart';
import 'viewModel/home_events_view_model.dart'; // ViewModel 추가

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeViewModel()), // HomeViewModel 등록
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(), // 첫 화면을 MainScreen으로 설정
    );
  }
}
