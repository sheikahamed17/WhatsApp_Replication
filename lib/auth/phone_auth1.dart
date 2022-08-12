import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Phone_auth extends StatefulWidget {
  const Phone_auth({Key? key}) : super(key: key);

  @override
  State<Phone_auth> createState() => _Phone_authState();
}

class _Phone_authState extends State<Phone_auth> {

  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationIDReceived = "";
  bool otpCodeVisible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Number'
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(
                height: 10,
              ),
              Visibility(
                visible: otpCodeVisible,
                child: TextField(
                  controller: otpController,
                  decoration: const InputDecoration(
                    labelText: 'OTP'
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    verifyNumber();
                  } ,
                  child: Text(otpCodeVisible ? 'Login' : 'verify'))
            ],
          ),
        ),
      ),
    );
  }

  void verifyNumber() {
    auth.verifyPhoneNumber(
        phoneNumber: phoneController.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) {
            print("You are logged in successfully");
          });
        },
        verificationFailed: (FirebaseException exception) {
          print(exception.message);
        },
        codeSent: (String verificationID, int? resendToken) {
          verificationIDReceived = verificationID;
          otpCodeVisible = true;
          setState(() {

          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {

        }
    );
  }
}
