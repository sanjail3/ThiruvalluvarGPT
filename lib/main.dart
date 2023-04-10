import 'package:ThiruvalluvarGPT/main/chatgpt/view/chatgpt_page.dart';
import 'package:flutter/material.dart';
import 'package:ThiruvalluvarGPT/Screens/welcomescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
      title: 'ThiruvalluvarGPT',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: WelcomeScreen(),


      );
}
