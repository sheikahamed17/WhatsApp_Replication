import 'package:flutter/material.dart';
import 'package:whatsapp_replication/auth/registration.dart';
import 'package:whatsapp_replication/theme/style.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Welcome to Whatsapp',
                style: TextStyle(
                  fontSize: 20,
                  color: primaryColor,
                  fontWeight: FontWeight.bold
                ),
                ),
                Container(
                  height: 290,
                  width: 290,
                  child: Image.asset('assets/brand.png'),
                ),
                Column(
                  children: [
                    Text("Read our Privacy Policy Tap, 'Agree and Continue' to accept the Terms of Service",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      color: greenColor,
                        onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => RegistrationScreen()));
                        },
                      child: Text("AGREE AND CONTINUE",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
