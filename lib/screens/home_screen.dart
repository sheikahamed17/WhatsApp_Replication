import 'package:flutter/material.dart';
import 'package:whatsapp_replication/screens/chats_page.dart';
import 'package:whatsapp_replication/screens/status_page.dart';
import 'package:whatsapp_replication/theme/style.dart';

import '../test.dart';
import '../widgets/custom_tab_bar.dart';
import 'calls_page.dart';
import 'camera_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 bool _isSearch=false;

 int _currentPageIndex=1;
 PageController _pageViewController= PageController(initialPage: 1);
 List<Widget> _page =[
   CameraPage(),
   ChatsPage(),
   StatusPage(),
   CallsPage()
 ];

 _buildSearch() {
   return Container(
     margin: EdgeInsets.only(top: 25),
     height: 45,
     decoration: BoxDecoration(
       color: Colors.white,
       boxShadow: [
         BoxShadow(
           color: Colors.black.withOpacity(.3),
           spreadRadius: 1,
           offset: Offset(0.0,0.50)
         )
       ]
     ),
     child: TextField(
       decoration: InputDecoration(
         hintText: "Search...",
             prefixIcon: InkWell(
                 onTap: () {
                   //TODO
                   setState((){
                     _isSearch==false;
                   });
                 },
                 child: Icon(Icons.arrow_back))
       ),
     ),
   );
 }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: _currentPageIndex!=0 ? AppBar(
            elevation: 0,
            backgroundColor: _isSearch==false?primaryColor:Colors.transparent,
            title: _isSearch==false
                ? Text('WhatsApp')
                : Container(height: 0,width: 0,),
            flexibleSpace: _isSearch==false
                ? Container(height: 0,width: 0,)
                :_buildSearch(),
            automaticallyImplyLeading: false,
            actions: <Widget>[
              InkWell(
                  onTap: () {
                    setState(() {
                      _isSearch=true;
                    });
                  },
                  child: Icon(Icons.search)),
              SizedBox(
                width: 5,
              ),
              Icon(Icons.more_vert)
            ],
          ):null,
          body: Column(
            children: [
              //TODO: CustomTabBar
              _isSearch==false
                  ? _currentPageIndex!=0
                  ? CustomTabBar(index: _currentPageIndex)
                  :Container()
                  :Container(),
              Expanded(
                  child: PageView.builder(
                    itemCount: _page.length,
                    controller: _pageViewController,
                    onPageChanged: (index){
                      setState((){
                        _currentPageIndex=index;
                      });
                    },
                    itemBuilder: (_,index) {
                      return _page[index];
                    },
                  ),
              ),
            ],
          ),
        ));
  }
}
