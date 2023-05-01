import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';

class MessageController with ChangeNotifier {
  List<Map<String, dynamic>> messages = [];
  final TextEditingController controller = TextEditingController();
  late DialogFlowtter dialogFlowtter;
  bool isLoadingPrimary = false;
  bool isLoadingSecondary = false;
  initDialogFlowtter() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    notifyListeners();
  }

  sendMesage(String text) async {
    if (controller.text.isEmpty) {
      print('Message is empty');
    } else {
      addMessage(Message(text: DialogText(text: [text])), true);
      notifyListeners();
      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      notifyListeners();
      if (response.message == null) return;
      print(response.message.toString());
      addMessage(response.message!);
      notifyListeners();
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    // messages.add({'message': message, 'isUserMessage': isUserMessage});
    messages.insert(0, {'message': message, 'isUserMessage': isUserMessage});

    notifyListeners();
  }
}
