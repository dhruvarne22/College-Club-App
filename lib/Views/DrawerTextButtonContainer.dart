import 'package:aiem_project/Views/AIEM_Core.dart';
import 'package:aiem_project/Views/AIEMnotification.dart';
import 'package:aiem_project/Views/about_us.dart';
import 'package:aiem_project/Views/profile.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
const kHeadingTextStyle=TextStyle(fontSize: 20 , fontWeight: FontWeight.bold, color: Colors.black);


class DrawerTextButtonContainer extends StatelessWidget {
  Map<String,dynamic> UserData;
  DrawerTextButtonContainer({
    required this.UserData
});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/logo/AIEM_LOGO.png"),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(8.0),
            child: TextButton(onPressed: (){

            },child:Text("HOME" , style: kHeadingTextStyle, textAlign: TextAlign.left,),),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(8.0),
            child: TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile(UserData: UserData,)));
            }, child: Text("PROFILE" , style: kHeadingTextStyle, textAlign: TextAlign.left,),),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(8.0),
            child: TextButton(onPressed: () async{
              await launch("https://www.aiem.in");

            }, child: Text("AIEM WEB" , style: kHeadingTextStyle, textAlign: TextAlign.left,),),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(8.0),
            child: TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AIEMNotification()));
            }, child: Text("NOTIFICATIONS" , style: kHeadingTextStyle, textAlign: TextAlign.left,),),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(8.0),
            child: TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AIEMcoreteam()));
            }, child: Text("AIEM CORE" , style: kHeadingTextStyle, textAlign: TextAlign.left,),),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(8.0),
            child: TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutUs()));
            }, child: Text("ABOUT US" , style: kHeadingTextStyle, textAlign: TextAlign.left,),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(color: Colors.grey,height: 2,width: 200,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Version 1.2" , style: TextStyle(fontSize: 12 , color: Colors.black), textAlign: TextAlign.left,),
                  ),
                ],
              ),

            ],
          ),





        ],
      ),

    );
  }
}
