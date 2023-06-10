import 'package:chatgpt_course/providers/models_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'color_schemes.g.dart';
import 'providers/chats_provider.dart';
import 'screens/chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ModelsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter ChatBOT',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          primaryColor: const Color(0xFF5E38EB),
          cardColor: Colors.white,
          fontFamily: 'Pretendard',
          textTheme: const TextTheme(
            bodyLarge: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
            headlineMedium: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
        ),
        home: const ChatScreen(),
      ),
    );
  }
}
