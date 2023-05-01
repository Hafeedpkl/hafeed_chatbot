import 'package:flutter/material.dart';
import 'package:hafeed_chatbot/controller/message_controller.dart';
import 'package:hafeed_chatbot/views/message_screen.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MessageController>(context, listen: false)
          .initDialogFlowtter();
    });
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
        children: [Expanded(child: MessageScreen()), textSection(context)],
      ),
    );
  }

  Container textSection(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(10),
      height: size.height * 0.05,
      width: double.infinity,
      // color: Colors.white,
      child: Consumer<MessageController>(builder: (context, value, _) {
        return TextField(
          controller: value.controller,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(8),
              hintText: 'Type something..',
              suffixIcon: value.isLoadingPrimary == false
                  ? IconButton(
                      onPressed: () {
                        value.sendMesage(value.controller.text);
                        value.controller.clear();
                      },
                      icon: const Icon(
                        Icons.send,
                      ))
                  : CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 10,
                      child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 10,
                          child: CircularProgressIndicator()),
                    )),
          onSubmitted: (submit) {
            value.sendMesage(value.controller.text);
            value.controller.clear();
          },
        );
      }),
    );
  }
}
