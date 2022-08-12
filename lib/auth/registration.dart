import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_replication/auth/phone_verification.dart';

import '../theme/style.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  Country _selectedFilteredDialogCountry = CountryPickerUtils.getCountryByPhoneCode('91');
  String _countryCode = '+91';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                textAlign: TextAlign.center,
                  style: TextStyle(
                  fontSize: 16,
                ),
                ),
                SizedBox(
                  height: 30,
                ),
                ListTile(
                  onTap: _openFilteredCountryPickerDialog,
                  title: _buildDialogItem(_selectedFilteredDialogCountry),
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1.50,color: greenColor))
                      ),
                      width: 80,
                      height: 42,
                      alignment: Alignment.center,
                      child: Text('${_selectedFilteredDialogCountry.phoneCode}'),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Phone Number'
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: MaterialButton(
                        color: greenColor,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => PhoneVerification()));
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

  void _openFilteredCountryPickerDialog() {
    showDialog(context: context, builder: (_) => Theme(
      data: Theme.of(context).copyWith(primaryColor: primaryColor,),
      child: CountryPickerDialog(
        titlePadding: EdgeInsets.all(8.0),
        searchCursorColor: Colors.black,
        searchInputDecoration: InputDecoration(
            border: OutlineInputBorder() ,
          hintText: 'Search'
        ),
        isSearchable: true,
        title: Text('Select your phone code'),
        onValuePicked: (Country country) {
          setState(() {
            _selectedFilteredDialogCountry = country;
            _countryCode = country.phoneCode;
          });
        },
        itemBuilder: _buildDialogItem,
      ),
    ));
  }

 Widget _buildDialogItem(Country country) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: greenColor,width: 1))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(height: 8.0,),
          Text('+${country.phoneCode}'),
          SizedBox(height: 8.0,),
          Text('${country.name}'),
          Spacer(),
          Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }
}
