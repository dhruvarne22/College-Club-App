import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
   AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About AIEM"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items : AboutUsitems.map((item) {
                return Builder(
                    builder: (BuildContext context){
                      return InkWell(
                        onTap: () {
                          print("MUJHE MARRO MAT");
                        },
                        child: Container(
                          margin : EdgeInsets.symmetric(horizontal : 5 , vertical : 14),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(

                                  fit: BoxFit.cover,

                                  image: NetworkImage(item)
                              )

                          ),
                        ),
                      );
                    }
                );
              }).toList(),
              options : CarouselOptions(
                  height : 200,
                  autoPlay : true,
                  enlargeCenterPage : true
              ),),
SizedBox(height: 40,),
            Container(
              margin: EdgeInsets.only(left: 20),
                child: Text("We Are AIEM" ,style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold), textAlign: TextAlign.start,)),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
              height: 200,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               image: DecorationImage(
                 image: AssetImage("assets/aiem_banners/AIem_ban1.jpg"),fit: BoxFit.cover
               )
             ),
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(radius: 40,),SizedBox(height: 5,),Text("Feature 1" ,style: TextStyle(fontSize: 17 , fontWeight: FontWeight.bold),)
                        ],
                      ),

                      Column(
                        children: [
                          CircleAvatar(radius: 40,),SizedBox(height: 5,),Text("Feature 1" ,style: TextStyle(fontSize: 17 , fontWeight: FontWeight.bold),)
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(radius: 40,),SizedBox(height: 5,),Text("Feature 1" ,style: TextStyle(fontSize: 17 , fontWeight: FontWeight.bold),)
                        ],
                      )



                    ],
                  ),
                  SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(radius: 40,),SizedBox(height: 5,),Text("Feature 1" ,style: TextStyle(fontSize: 17 , fontWeight: FontWeight.bold),)
                        ],
                      ),

                      Column(
                        children: [
                          CircleAvatar(radius: 40,),SizedBox(height: 5,),Text("Feature 1" ,style: TextStyle(fontSize: 17 , fontWeight: FontWeight.bold),)
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(radius: 40,),SizedBox(height: 5,),Text("Feature 1" ,style: TextStyle(fontSize: 17 , fontWeight: FontWeight.bold),)
                        ],
                      )



                    ],
                  )
                ],
              ),
            ),

           Container(padding: EdgeInsets.all(20),
             child: Text("AIEM Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." ,style: TextStyle(fontSize: 18),),)
          ],
        ),
      ),
    );
  }


  final List AboutUsitems = [
    "https://i.ytimg.com/vi/oV74Najm6Nc/maxresdefault.jpg",
    "https://i.ytimg.com/vi/VwtC_4t2g5M/maxresdefault.jpg",
    "https://i.ytimg.com/vi/5IvQ3fYKnfM/maxresdefault.jpg",
  ];
}
