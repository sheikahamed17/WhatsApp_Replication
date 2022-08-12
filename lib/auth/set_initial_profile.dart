import 'package:flutter/material.dart';
import 'package:whatsapp_replication/screens/home_screen.dart';
import 'package:whatsapp_replication/theme/style.dart';

class SetInitialProfile extends StatefulWidget {
  const SetInitialProfile({Key? key}) : super(key: key);

  @override
  State<SetInitialProfile> createState() => _SetInitialProfileState();
}

class _SetInitialProfileState extends State<SetInitialProfile> {
  TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 40),
            child: Column(
              children: [
                Text('Profile Info',
                style: TextStyle(
                  color: greenColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
                ),
                SizedBox(height: 20,),
                Text('Please provide your name and optional Profile Photo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
                ),
                SizedBox(height: 30,),
                _rowWidget(),
                Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: MaterialButton(
                        color: greenColor,
                        onPressed: () {
                          //TODO
                          Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen() ));
                          },
                        child: Text('Next',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white
                          ),
                        ),
                      ),
                    )
                ),
              ],
            ),
          ),
        ));
  }

 Widget _rowWidget() {
    return Container(
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: textIconColorGrey,
              borderRadius: BorderRadius.all(Radius.circular(25))
            ),
            child: Icon(Icons.camera_alt),
          ),
          SizedBox(width: 8,),
          Expanded(
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Enter your name.',
                ),
              )
          ),
          SizedBox(width: 8,),
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: textIconColorGrey,
              borderRadius: BorderRadius.all(Radius.circular(25))
            ),
            child: Icon(Icons.insert_emoticon),
          ),
        ],
      ),
    );
 }
}
