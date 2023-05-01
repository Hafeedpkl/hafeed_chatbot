import 'package:flutter/material.dart';
import 'package:hafeed_chatbot/controller/message_controller.dart';
import 'package:provider/provider.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MessageController>(builder: (context, value, _) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: value.messages.isNotEmpty
            ? ListView.separated(
                reverse: true,
                itemBuilder: (context, index) {
                  return !value.messages[index]['isUserMessage']
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 16),
                              child: const CircleAvatar(
                                child: Text('hp'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.75,
                                  margin: const EdgeInsets.only(top: 5),
                                  child: SelectableText(value
                                      .messages[index]["message"].text.text[0]),
                                ),
                              ),
                            )
                          ],
                        )
                      : Align(
                          alignment: Alignment.centerRight,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                margin: const EdgeInsets.only(top: 5),
                                child: SelectableText(value
                                    .messages[index]["message"].text.text[0]),
                              ),
                            ),
                          ),
                        );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemCount: value.messages.length)
            : Align(
                alignment: Alignment.bottomCenter,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: const Text(
                          'Hello there 🤖, I am Hp. You can ask me anything about hafeed '),
                    ),
                  ),
                ),
              ),
      );
    });
  }
}
