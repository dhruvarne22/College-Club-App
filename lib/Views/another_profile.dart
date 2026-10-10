import 'package:aiem_project/Views/GetInTouchContainer.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class Another_Profile extends StatefulWidget {
  String userid;
  Another_Profile({
    required this.userid
});

  @override
  _Another_ProfileState createState() => _Another_ProfileState();
}

class _Another_ProfileState extends State<Another_Profile> {
  late Map<String, dynamic> UserData;
  final double circleRadius = 120.0;
  bool isLoading  = true;
  FetchUserProfile() async{
    await FirebaseFirestore.instance.collection("users").where("userid", isEqualTo: widget.userid).get().then((value) {

      UserData = value.docs[0].data();
      UserData["docid"] = value.docs[0].id.toString();
    });
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FetchUserProfile();
  }
  @override
  Widget build(BuildContext context) {
    return isLoading ? Scaffold(body: Center(child: CircularProgressIndicator(),)) : Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color(0xffE0E0E0),
                  image: DecorationImage(
                      image: AssetImage("assets/aiem_banners/AIem_ban1.jpg"),
                      fit: BoxFit.cover
                  )
              ),
              height: 550,
              width: double.infinity,

              child: Stack(children: <Widget>[

                Padding(
                  padding: const EdgeInsets.only(top: 150 , left: 18 , right: 18),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[

                      Container(
                          margin: EdgeInsets.only(top:53 , left: 13),
                          child: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
                            Navigator.pop(context);
                          } ,iconSize: 30,)  ),
                      Padding(
                        padding:
                        EdgeInsets.only(top: circleRadius / 2.0, ),  ///here we create space for the circle avatar to get ut of the box
                        child: Container(
                          height: 300.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8.0,
                                offset: Offset(0.0, 5.0),
                              ),
                            ],
                          ),
                          width: double.infinity,
                          child: Padding(
                              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: circleRadius/2,),

                                  Text(UserData["name"]
                                    , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27.0),),
                                  SizedBox(height: 5,),
                                  Text('${UserData["position"]}\n${UserData["department"]}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.lightBlueAccent), textAlign: TextAlign.center,),

                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Text('Credits', style: TextStyle( fontSize: 20.0,  color: Colors.black54,),),
                                            Text('${UserData["credit"]}', style: TextStyle( fontSize: 34.0, color: Colors.black87, fontFamily: ''),),
                                          ],
                                        ),
//TODO: ADD STREAK THING LOGIC HERE
                                        Column(
                                          children: <Widget>[
                                            Text('AIEM Streak', style: TextStyle( fontSize: 20.0,  color: Colors.black54),),
                                            Text('500', style: TextStyle( fontSize: 34.0, color: Colors.black87, fontFamily: ''),),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                          ),
                        ),
                      ),



                      ///Image Avatar
                      Container(
                        width: circleRadius,
                        height: circleRadius,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 8.0,
                              offset: Offset(0.0, 5.0),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Center(
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(UserData["profile_pic"]),
                                radius: 54,
                              )

                            // Container(
                            //   child: Image.network("https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80"), /// replace your image with the Icon
                            // ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("Bio" , style: TextStyle(fontSize: 22 , fontWeight: FontWeight.w600 ,), textAlign: TextAlign.start,),
                  SizedBox(height: 5,),

                  ExpandableText(
                    UserData["bio"],
                    expandText: 'show more',
                    collapseText: 'show less',
                    maxLines: 3,
                    linkColor: Colors.blue,
                  ),

                  SizedBox(height: 15,),
                  Text("Task History" , style: TextStyle(fontSize: 22 , fontWeight: FontWeight.w600 ,), textAlign: TextAlign.start,),
                  SizedBox(height: 5,),
                  _getTasks(UserData),




                  SizedBox(height: 15,),
                  //               Text("Superior Info" , style: TextStyle(fontSize: 22 , fontWeight: FontWeight.w600 ,), textAlign: TextAlign.start,),
                  //               SizedBox(height: 5,),
                  //
                  //
                  // SingleChildScrollView(
                  // scrollDirection: Axis.horizontal,
                  // child: Row(
                  // children:[
                  //
                  //               TeamsAndProjectsContainer(),
                  //               TeamsAndProjectsContainer(title: "Sourav", subtitle: "VP"),
                  //               TeamsAndProjectsContainer(title: "Prajjwal ", subtitle: "HEAD"),
                  //
                  // ],
                  // ),
                  //
                  // ),

                  SizedBox(height: 15,),
                  Text("App Features" , style: TextStyle(fontSize: 22 , fontWeight: FontWeight.w600 ,), textAlign: TextAlign.start,),
                  SizedBox(height: 5,),


                  // Automatic Horizontally Sliding (Info Video) Thumbnails
                  CarouselSlider(
                    items : AppFeatitems.map((item) {
                      return Builder(
                          builder: (BuildContext context){
                            return InkWell(
                              onTap: () {
                                print("MUJHE MARRO MAT");
                              },
                              child: Container(
                                margin : EdgeInsets.symmetric(horizontal : 5 , vertical : 14),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
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
                        height : 150,
                        autoPlay : true,
                        enlargeCenterPage : true
                    ),),

                  GetInTouchContainer()




                ],
              ),
            )
          ],

        ),
      ),
    );
  }

  final List AppFeatitems = [
    "https://i.ytimg.com/vi/oV74Najm6Nc/maxresdefault.jpg",
    "https://i.ytimg.com/vi/VwtC_4t2g5M/maxresdefault.jpg",
    "https://i.ytimg.com/vi/5IvQ3fYKnfM/maxresdefault.jpg",
  ];
}





Widget _getTasks(Map<String, dynamic> UserData) {
  print(UserData["docid"]);
  return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users').doc(UserData["docid"]).collection("credits_history").orderBy('task_date', descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {






        return    Container(
          margin: EdgeInsets.symmetric(horizontal:1, vertical: 10),
          decoration: BoxDecoration(

              border: Border.all(color: Colors.grey , width: 2),

              borderRadius: BorderRadius.circular(20)
          ),
          child: SizedBox(
              height: 300,
              child:  snapshot.hasData ?
              ListView.separated(
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context , index){
                    print(snapshot.data?.docs[index]);
                    //TODO: Create a onlichk dialog box functionality
                    return ListTile(
                      title: Text(snapshot.data?.docs[index]['task_name']),
                      subtitle: Text("${snapshot.data?.docs[index]['task_date']}"),
                      trailing: Text("${snapshot.data?.docs[index]['credits']} Credits" ,style: TextStyle(fontWeight: FontWeight.bold),),
                    );
                  }, separatorBuilder: (context , index){
                return Divider();
              }, itemCount: snapshot.data?.docs.length ?? 0)

                  :  Container(child: Center(child: Text("NO TASK HISTORY FOUND"),),)

          ),

        );




      });
}