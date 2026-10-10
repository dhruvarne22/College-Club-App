import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:aiem_project/Views/CommentsContainer.dart';
import 'package:aiem_project/Views/ShoutOutContainer.dart';
import 'package:aiem_project/Views/TeamsAndProjectsContainer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CustomAppBar.dart';
import 'DrawerTextButtonContainer.dart';
import 'GetInTouchContainer.dart';

import 'UpcomingEventsContainer.dart';

class Home extends StatefulWidget {
Map<String, dynamic> UserData;
Home({
    required this.UserData
});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation _colorTween,_homeTween,_yogaTween,_iconTween,_drawerTween;
  late AnimationController _textAnimationController;
  List<Map<String,dynamic>> upcoming_events = [];
  List<Map<String,dynamic>> watchInfoVid = [];
  List<Map<String,dynamic>> watchTeam_n_Proj = [];

  bool isLoading = true;


  FetchTeam_n_Projects() async{
    await FirebaseFirestore.instance.collection("team_n_project").get().then((value){
      value.docs.forEach((element) {
        print(element.data());
        watchTeam_n_Proj.add(element.data());
      });
      print("I AM ENDING");
      setState(() {
        isLoading = false;
      });
      print("I AM ENDING");
    });

  }
  
  FetchEvents() async{
    await FirebaseFirestore.instance.collection("events").get().then((value){
      value.docs.forEach((element) {
        print(element.data());
        upcoming_events.add(element.data());
      });
      print("I AM ENDING");

      print("I AM ENDING");
    });



  }

  FetchYtVid() async{
    await FirebaseFirestore.instance.collection("youtube_videos").get().then((value){
      value.docs.forEach((element) {
        print(element.data());
        watchInfoVid.add(element.data());
      });
      print("I AM ENDING");

      print("I AM ENDING");
    });



  }


  @override
  void initState() {
    _animationController = AnimationController(vsync: this , duration: Duration(seconds: 0));
    _colorTween = ColorTween(begin: Colors.transparent , end: Colors.white).animate(_animationController);
    _iconTween = ColorTween(begin: Colors.white , end: Colors.lightBlue).animate(_animationController);
    _drawerTween = ColorTween(begin: Colors.white , end: Colors.black).animate(_animationController);
    _homeTween = ColorTween(begin: Colors.white , end: Colors.deepPurpleAccent).animate(_animationController);
    _yogaTween = ColorTween(begin: Colors.white , end: Colors.black).animate(_animationController);
    _textAnimationController = AnimationController(vsync: this , duration: Duration(seconds: 0));


    super.initState();

    FetchEvents();
    FetchYtVid();
    FetchTeam_n_Projects();
  }



  bool scrollListner(ScrollNotification scrollNotification){
    bool scroll = false;
    if(scrollNotification.metrics.axis == Axis.vertical){
      _animationController.animateTo(scrollNotification.metrics.pixels/80);
      _textAnimationController.animateTo(scrollNotification.metrics.pixels);
      return scroll = true;
    }
    return scroll;
  }
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return isLoading ? Scaffold(body: Center(child: LinearProgressIndicator(),),) :  Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        //Container for the textbuttons present in drawer

        child: DrawerTextButtonContainer(UserData: widget.UserData,),
      ),
      backgroundColor: Colors.white,
      body: NotificationListener(
        onNotification: scrollListner,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color : Colors.deepPurpleAccent,
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
                              ),

                              padding: EdgeInsets.only(top:100 , bottom: 20),
                              child: CarouselSlider(
                                items : items.map((item) {
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
                            ),
                            Container(
                              padding: EdgeInsets.all(20),

                              child: Card(
                                elevation: 0.0,

                                // Credit Viewing Window
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(

                                      child: Column(
                                        children: [
                                          Align(

                                              child: Text("You earned" , style: TextStyle(fontSize: 17),),
                                              alignment : Alignment.centerLeft
                                          ),
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text("${widget.UserData["credit"]} CREDITS" , style: TextStyle(fontSize: 25 ,  fontWeight: FontWeight.bold),)),
                                          Text("IN TOTAL"),
                                        ],
                                      ),
                                    ),
                                    Container(
padding: EdgeInsets.only(right: 15),
                                      child: Column(
                                        children: [
                                          Icon(Icons.emoji_emotions ,color: Colors.purple, size: 55,),
                                          Text("GREAT!"  ,style: TextStyle(fontSize: 17),)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),


                            // Upcoming events heading text
                            Container(
                              padding : EdgeInsets.all(15),
                              width : MediaQuery.of(context).size.width,
                              child: Text("Upcoming Events" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
                            ) ,

                            // Upcoming Events Scrollable List Container
                            UpcomingEventsContainer(UpcomingEvents: upcoming_events,),
                            //Upcoming Events View more Button
                            TextButton(onPressed: (){}, child: Text("VIEW MORE")),
                            //Info Videos Container
                            Container(
                              padding : EdgeInsets.all(15),
                              width : MediaQuery.of(context).size.width,
                              //Watch Informative Videos Heading Text
                              child: Text("Watch Info Videos" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
                            ) ,
                            // Automatic Horizontally Sliding (Info Video) Thumbnails
                            CarouselSlider(
                              items : watchInfoVid.map((item) {
                                return Builder(
                                    builder: (BuildContext context){
                                      return InkWell(
                                        onTap: () async{
                                          await launch(item["videolink"]);
                                        },
                                        child: Container(
                                          margin : EdgeInsets.symmetric(horizontal : 5 , vertical : 14),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              image: DecorationImage(

                                                  fit: BoxFit.cover,

                                                  image: NetworkImage(item["video_thumb"])
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

                            // Shoutout Container
                            // ShoutOutContainer(),

                            //Appreciation Comments header text
                            // Padding(
                            //   padding: const EdgeInsets.all(15.0),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.start,
                            //     children:[Text("Appreciation From Crowd" , style: kHeadingTextStyle, textAlign: TextAlign.left,)], ),
                            // ),

                            // SingleChildScrollView(
                            //   scrollDirection: Axis.horizontal,
                            //   child: Row(
                            //     children: [
                            //       //Appreciation From Crowd Container
                            //       CommentsContainer(),
                            //       CommentsContainer(),
                            //       CommentsContainer(),
                            //     ],
                            //   ),
                            // ),

                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:[Text("Best Teams & Projects In AIEM Club" , style: kHeadingTextStyle, textAlign: TextAlign.left,)], ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children:[
                                 TeamsAndProjectsContainer(Data: watchTeam_n_Proj[0],),
                                 // TeamsAndProjectsContainer(Data: watchTeam_n_Proj[1],),
                                 // TeamsAndProjectsContainer(Data: watchTeam_n_Proj[2],)




                                ],
                              ),

                            ),








                            //Club logo and links
                            GetInTouchContainer(),


                          ],
                        ),
                      ],
                    ),
                  ),
                  CustomAppBar(animationController: _animationController, colorsTween: _colorTween, drawerTween: _drawerTween, homeTween: _homeTween, iconTween: _iconTween, onPressed: (){scaffoldKey.currentState?.openDrawer();}, yogaTween: _yogaTween, UserImgUrl: widget.UserData["profile_pic"],)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  final List items = [
    "https://images.unsplash.com/photo-1451187580459-43490279c0fa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=872&q=80",
    "https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    "https://images.unsplash.com/photo-1496065187959-7f07b8353c55?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
  ];

  final List Viditems = [
    "https://i.ytimg.com/vi/oV74Najm6Nc/maxresdefault.jpg",
    "https://i.ytimg.com/vi/VwtC_4t2g5M/maxresdefault.jpg",
    "https://i.ytimg.com/vi/5IvQ3fYKnfM/maxresdefault.jpg",
  ];
}






