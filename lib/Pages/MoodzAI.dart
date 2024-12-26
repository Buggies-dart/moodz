import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:soundbarz/components.dart';
import 'package:uuid/uuid.dart';
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<types.Message> _messages = [];
  final types.User _currentUser = types.User(id: const Uuid().v4());

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _onSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _currentUser,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  @override
  Widget build(BuildContext context) {
      final sizeQuery = MediaQuery.of(context).size;
    return Scaffold( backgroundColor: scaffoldColor,
      body: Column(
        children: [
        Container( width: double.infinity, color: primaryAssetColor,
        child:  Padding(
          padding:  EdgeInsets.only(top: sizeQuery.height/20),
          child: Column(
          children: [
             Icon(MdiIcons.robot, color: white,
            size: sizeQuery.height/15,),
                 Row( mainAxisAlignment: MainAxisAlignment.center,
                   children: [ const Padding(
                     padding:  EdgeInsets.only(right: 5),
                     child:  Icon(MdiIcons.circle, color: Colors.green, size: 15,),
                   ),
                     Text('Moodz', style: Textstyling.subtitleText(),),
                   ],
                 ) ],
                ),
        ),
        ),
          Expanded(
            child: Chat( theme: const DefaultChatTheme(backgroundColor: scaffoldColor,
          inputBackgroundColor: white, inputBorderRadius: BorderRadius.all(Radius.circular(30)),
          inputElevation: 30, inputTextColor: Colors.black,
          sentMessageBodyTextStyle: TextStyle(color: white,),
          ),
              messages: _messages,
              onSendPressed: _onSendPressed,
              user: _currentUser, 

            ),
          ),
       SizedBox(height: sizeQuery.height/50)  ],
      ),
    );
  }
}
