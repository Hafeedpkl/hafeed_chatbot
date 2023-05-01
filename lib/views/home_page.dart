import 'dart:developer';

import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:hafeed_chatbot/views/message_screen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> messages = [];
  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          radius: 10,
          backgroundColor: Colors.transparent,
          child: CircleAvatar(
            child: Image.asset(
              'images/chatbot.png',
            ),
          ),
        ),
        title: Text('Mr.HP bot'),
      ),
      body: Column(
        children: [
          Expanded(child: MessageScreen(message: messages)),
          textSection()
        ],
      ),
    );
  }

  Container textSection() {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(10),
      height: size.height * 0.05,
      width: double.infinity,
      // color: Colors.white,
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(8),
            hintText: 'Type something..',
            suffixIcon: IconButton(
                onPressed: () {
                  sendMesage(_controller.text);
                  _controller.clear();
                },
                icon: const Icon(
                  Icons.send,
                ))),
      ),
    );
  }

  sendMesage(String text) async {
    if (_controller.text.isEmpty) {
      print('Message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });
      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      print(response.message.toString());
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}
