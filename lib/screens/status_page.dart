import 'package:flutter/material.dart';
import 'package:whatsapp_replication/screens/single_item_chat_user.dart';
import 'package:whatsapp_replication/theme/style.dart';

import 'single_item_store.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Scaffold(
            body: Stack(
              children: [
                _customeFloatingActionButton(),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      _storyWidget(),
                      SizedBox(height: 8,),
                      _recentTextWidget(),
                      SizedBox(height: 8,),
                      _listStories(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ));
  }

   Widget _customeFloatingActionButton() {
    return Positioned(
      right: 10,
        bottom: 15,
        child: Column(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4.0),
                    blurRadius: 0.50,
                    color: Colors.black.withOpacity(.2),
                    spreadRadius: 0.10)
                ]
              ),
              child: Icon(Icons.edit,color: Colors.blueGrey,),
            ),
            SizedBox(height: 8,),
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: primaryColor,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4.0),
                    blurRadius: 0.50,
                    color: Colors.black.withOpacity(.2),
                    spreadRadius: 0.10)
                ]
              ),
              child: Icon(Icons.camera_alt,color: Colors.white,),
            ),
          ],
        )
    );
   }

 Widget _storyWidget() {
    return Container(
      margin: EdgeInsets.only(left: 10,right: 10,top: 4),
      child: Row(
        children: [
          Container(
            height: 55,
            width: 55,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Image.asset('assets/profile.png'),
                ),
                Positioned(
                  right: 0,
                    bottom: 0,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Icon(Icons.add,color: Colors.white,size: 15,),
                    )
                ),
              ],
            ),
          ),
          SizedBox(width: 12,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('My Status',
              style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),
              ),
              SizedBox(height: 2,),
              Text("Tap to add status update")
            ],
          )
        ],
      ),
    );
 }

 Widget _recentTextWidget() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[200]
      ),
      child: Text("Recent updates"),
    );
 }

  Widget _listStories() {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemBuilder: (BuildContext context,int index) {
        return SingleItemStorePage();
      },

    );
  }
}
