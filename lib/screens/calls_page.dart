import 'package:flutter/material.dart';
import 'package:whatsapp_replication/theme/style.dart';

import 'single_item_call.dart';

class CallsPage extends StatelessWidget {
  const CallsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context,int index) {
              return SingleItemCall();
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: primaryColor,
            child: Icon(Icons.add_call,color: Colors.white,),
          ),
        ));
  }
}
