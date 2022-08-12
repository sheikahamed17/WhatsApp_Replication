import 'package:flutter/material.dart';
import 'package:whatsapp_replication/theme/style.dart';

class SingleItemCall extends StatelessWidget {
  const SingleItemCall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10,right: 10,left: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 55,
                    width: 55,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      child: Image.asset('assets/profile.png'),
                    ),
                  ) ,
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(('User Name'),style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Icon(Icons.call_received,color: primaryColor,size: 18,),
                          Text("Yesterday",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Icon(Icons.call,color: primaryColor,)
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 60,right: 10),
            child: Divider(
              thickness: 1.50,
            ),
          )
        ],
      ),
    );;
  }
}
