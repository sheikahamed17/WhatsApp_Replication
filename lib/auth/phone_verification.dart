import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:whatsapp_replication/auth/set_initial_profile.dart';
import '../theme/style.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({Key? key}) : super(key: key);

  @override
  State<PhoneVerification> createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  TextEditingController _pinCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text('Verify your phone number',
                    style: TextStyle(
                        fontSize: 18,
                        color: greenColor,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'poppins-bold'
                    ),
                  ),
                  Icon(Icons.more_vert)
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text('WhatsApp will send SMS message to Verify your phone number (carrier charges may apply) Enter your country code and phone number:',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              _pinCodeWidget(),
              Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: MaterialButton(
                      color: greenColor,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => SetInitialProfile()));
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
      ),
    );
  }

  Widget _pinCodeWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          PinCodeTextField(
            appContext: context,
            controller: _pinCodeController,
            length: 6,
            autoDisposeControllers: false,
            obscureText: true,
            backgroundColor: Colors.transparent,
            onChanged: (pinCode) {
              print(pinCode);
            },
          ),
          Text("Enter your 6 digit code")
        ],
      )
    );
  }
  @override
  void dispose() {
    _pinCodeController.dispose();
    super.dispose();
  }
}
