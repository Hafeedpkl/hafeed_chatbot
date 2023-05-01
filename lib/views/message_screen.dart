import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key, required this.message});
  final List message;
  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: widget.message.isNotEmpty
          ? ListView.separated(
              itemBuilder: (context, index) {
                return !widget.message[index]['isUserMessage']
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
                                width: MediaQuery.of(context).size.width * 0.75,
                                margin: const EdgeInsets.only(top: 5),
                                child: Text(widget
                                    .message[index]['message'].text.text[0]),
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
                              child: Text(widget
                                  .message[index]["message"].text.text[0]),
                            ),
                          ),
                        ),
                      );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
              itemCount: widget.message.length)
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
  }
}
