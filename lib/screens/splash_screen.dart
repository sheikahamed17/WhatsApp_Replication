import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:whatsapp_replication/auth/registration.dart';
import 'package:whatsapp_replication/screens/home_screen.dart';
import 'package:whatsapp_replication/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => WelcomeScreen()), (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 300,
            ),
            Image.asset('assets/logo.png',width: 200,height: 202,),
            SizedBox(
              height: 170,
            ),
            Text('from',
              style: TextStyle(
                  color: HexColor('#667788'),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'poppins-blod'
              ),
            ),
            Image.asset('assets/meta.png',width: 100,height: 100,)
          ],
        ),
      ),
    );
  }
}
