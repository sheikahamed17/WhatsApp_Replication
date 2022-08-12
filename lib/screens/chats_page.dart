import 'package:flutter/material.dart';
import 'package:whatsapp_replication/screens/single_item_chat_user.dart';
import 'package:whatsapp_replication/theme/style.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: (){},
          child: Icon(Icons.chat),
        ),
          body: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                      itemBuilder: (_,idex) {
                      return SingleItemChatUser();
                      }
                  )
              ),
            ],
          )
      ),
    );
  }
}
