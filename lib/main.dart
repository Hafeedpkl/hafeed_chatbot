import 'package:flutter/material.dart';
import 'package:hafeed_chatbot/controller/message_controller.dart';
import 'package:hafeed_chatbot/views/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MessageController>(
      create: (context) => MessageController(),
      child: Consumer<MessageController>(builder: (context, value, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Mr.HP Bot',
          theme: ThemeData(
            brightness: Brightness.light,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
          themeMode: value.isDay ? ThemeMode.light : ThemeMode.dark,
          home: const MyHomePage(),
        );
      }),
    );
  }
}
