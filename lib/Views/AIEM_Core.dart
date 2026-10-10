import 'package:aiem_project/Views/TeamDetailsPage.dart';
import 'package:aiem_project/Views/another_profile.dart';
import 'package:flutter/material.dart';

class AIEMcoreteam extends StatefulWidget {
  const AIEMcoreteam({Key? key}) : super(key: key);

  @override
  _AIEMcoreteamState createState() => _AIEMcoreteamState();
}

class _AIEMcoreteamState extends State<AIEMcoreteam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AIEM Club Core"),),
      body: SingleChildScrollView(
        child: Column(

          children: [
            Container(
height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/aiem_banners/AIem_ban1.jpg")
                )
              ),
            ),

SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(

                  height:225,
                  width: 125,
                  decoration: BoxDecoration(

                      border: Border.all(color: Colors.grey , width: 2),

                      borderRadius: BorderRadius.circular(20)
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      CircleAvatar(child: Image.network('https://pps.whatsapp.net/v/t61.24694-24/262329917_398875065002407_7470550408395113044_n.jpg?ccb=11-4&oh=01_AVxqEbGk_3yA-U4FPAM5H7so8xf-bUmwPAWXvuuYlY0utg&oe=625BDB26', ),radius:25.0,),
                      SizedBox(height: 20,),

                      Text("Dhananjay Arne"),
                      Text("President"),
                      SizedBox(height: 20,),

                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context){
                                  return Another_Profile(userid: "20bac10036");
                                }
                            ),
                          );


                        },
                        child: Text('View'),),
                      SizedBox(height: 20,),




                    ],
                  ),
                ),

                Container(

                  height:225,
                  width: 125,
                  decoration: BoxDecoration(

                      border: Border.all(color: Colors.grey , width: 2),

                      borderRadius: BorderRadius.circular(20)
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      CircleAvatar(child: Image.network('https://www.oseyo.co.uk/wp-content/uploads/2020/05/empty-profile-picture-png-2-2.png', ),radius:25.0,),
                      SizedBox(height: 20,),

                      Text("NAME"),
                      Text("POST"),
                      SizedBox(height: 20,),

                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context){
                                  return teamDetailsPage();
                                }
                            ),
                          );


                        },
                        child: Text('View'),),
                      SizedBox(height: 20,),




                    ],
                  ),
                ),

                Container(

                  height:225,
                  width: 125,
                  decoration: BoxDecoration(

                      border: Border.all(color: Colors.grey , width: 2),

                      borderRadius: BorderRadius.circular(20)
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      CircleAvatar(child: Image.network('https://www.oseyo.co.uk/wp-content/uploads/2020/05/empty-profile-picture-png-2-2.png', ),radius:25.0,),
                      SizedBox(height: 20,),

                      Text("NAME"),
                      Text("POST"),
                      SizedBox(height: 20,),

                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context){
                                  return teamDetailsPage();
                                }
                            ),
                          );


                        },
                        child: Text('View'),),
                      SizedBox(height: 20,),




                    ],
                  ),
                ),
              ],
            ),


            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(

                  height:225,
                  width: 125,
                  decoration: BoxDecoration(

                      border: Border.all(color: Colors.grey , width: 2),

                      borderRadius: BorderRadius.circular(20)
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      CircleAvatar(child: Image.network('https://www.oseyo.co.uk/wp-content/uploads/2020/05/empty-profile-picture-png-2-2.png', ),radius:25.0,),
                      SizedBox(height: 20,),

                      Text("NAME"),
                      Text("POST"),
                      SizedBox(height: 20,),

                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context){
                                  return teamDetailsPage();
                                }
                            ),
                          );


                        },
                        child: Text('View'),),
                      SizedBox(height: 20,),




                    ],
                  ),
                ),

                Container(

                  height:225,
                  width: 125,
                  decoration: BoxDecoration(

                      border: Border.all(color: Colors.grey , width: 2),

                      borderRadius: BorderRadius.circular(20)
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      CircleAvatar(child: Image.network('https://www.oseyo.co.uk/wp-content/uploads/2020/05/empty-profile-picture-png-2-2.png', ),radius:25.0,),
                      SizedBox(height: 20,),

                      Text("NAME"),
                      Text("POST"),
                      SizedBox(height: 20,),

                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context){
                                  return teamDetailsPage();
                                }
                            ),
                          );


                        },
                        child: Text('View'),),
                      SizedBox(height: 20,),




                    ],
                  ),
                ),

                Container(

                  height:225,
                  width: 125,
                  decoration: BoxDecoration(

                      border: Border.all(color: Colors.grey , width: 2),

                      borderRadius: BorderRadius.circular(20)
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      CircleAvatar(child: Image.network('https://www.oseyo.co.uk/wp-content/uploads/2020/05/empty-profile-picture-png-2-2.png', ),radius:25.0,),
                      SizedBox(height: 20,),

                      Text("NAME"),
                      Text("POST"),
                      SizedBox(height: 20,),

                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context){
                                  return teamDetailsPage();
                                }
                            ),
                          );


                        },
                        child: Text('View'),),
                      SizedBox(height: 20,),




                    ],
                  ),
                ),
              ],
            ),


            SizedBox(height: 20,),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(

                  height:225,
                  width: 125,
                  decoration: BoxDecoration(

                      border: Border.all(color: Colors.grey , width: 2),

                      borderRadius: BorderRadius.circular(20)
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      CircleAvatar(child: Image.network('https://www.oseyo.co.uk/wp-content/uploads/2020/05/empty-profile-picture-png-2-2.png', ),radius:25.0,),
                      SizedBox(height: 20,),

                      Text("NAME"),
                      Text("POST"),
                      SizedBox(height: 20,),

                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context){
                                  return teamDetailsPage();
                                }
                            ),
                          );


                        },
                        child: Text('View'),),
                      SizedBox(height: 20,),




                    ],
                  ),
                ),

                Container(

                  height:225,
                  width: 125,
                  decoration: BoxDecoration(

                      border: Border.all(color: Colors.grey , width: 2),

                      borderRadius: BorderRadius.circular(20)
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      CircleAvatar(child: Image.network('https://www.oseyo.co.uk/wp-content/uploads/2020/05/empty-profile-picture-png-2-2.png', ),radius:25.0,),
                      SizedBox(height: 20,),

                      Text("NAME"),
                      Text("POST"),
                      SizedBox(height: 20,),

                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context){
                                  return teamDetailsPage();
                                }
                            ),
                          );


                        },
                        child: Text('View'),),
                      SizedBox(height: 20,),




                    ],
                  ),
                ),

                Container(

                  height:225,
                  width: 125,
                  decoration: BoxDecoration(

                      border: Border.all(color: Colors.grey , width: 2),

                      borderRadius: BorderRadius.circular(20)
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      CircleAvatar(child: Image.network('https://www.oseyo.co.uk/wp-content/uploads/2020/05/empty-profile-picture-png-2-2.png', ),radius:25.0,),
                      SizedBox(height: 20,),

                      Text("NAME"),
                      Text("POST"),
                      SizedBox(height: 20,),

                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context){
                                  return teamDetailsPage();
                                }
                            ),
                          );


                        },
                        child: Text('View'),),
                      SizedBox(height: 20,),




                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(

                  height:225,
                  width: 125,
                  decoration: BoxDecoration(

                      border: Border.all(color: Colors.grey , width: 2),

                      borderRadius: BorderRadius.circular(20)
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      CircleAvatar(child: Image.network('https://www.oseyo.co.uk/wp-content/uploads/2020/05/empty-profile-picture-png-2-2.png', ),radius:25.0,),
                      SizedBox(height: 20,),

                      Text("NAME"),
                      Text("POST"),
                      SizedBox(height: 20,),

                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context){
                                  return teamDetailsPage();
                                }
                            ),
                          );


                        },
                        child: Text('View'),),
                      SizedBox(height: 20,),




                    ],
                  ),
                ),

                Container(

                  height:225,
                  width: 125,
                  decoration: BoxDecoration(

                      border: Border.all(color: Colors.grey , width: 2),

                      borderRadius: BorderRadius.circular(20)
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      CircleAvatar(child: Image.network('https://www.oseyo.co.uk/wp-content/uploads/2020/05/empty-profile-picture-png-2-2.png', ),radius:25.0,),
                      SizedBox(height: 20,),

                      Text("NAME"),
                      Text("POST"),
                      SizedBox(height: 20,),

                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context){
                                  return teamDetailsPage();
                                }
                            ),
                          );


                        },
                        child: Text('View'),),
                      SizedBox(height: 20,),




                    ],
                  ),
                ),

                Container(

                  height:225,
                  width: 125,
                  decoration: BoxDecoration(

                      border: Border.all(color: Colors.grey , width: 2),

                      borderRadius: BorderRadius.circular(20)
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      CircleAvatar(child: Image.network('https://www.oseyo.co.uk/wp-content/uploads/2020/05/empty-profile-picture-png-2-2.png', ),radius:25.0,),
                      SizedBox(height: 20,),

                      Text("NAME"),
                      Text("POST"),
                      SizedBox(height: 20,),

                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context){
                                  return teamDetailsPage();
                                }
                            ),
                          );


                        },
                        child: Text('View'),),
                      SizedBox(height: 20,),




                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(

                  height:225,
                  width: 125,
                  decoration: BoxDecoration(

                      border: Border.all(color: Colors.grey , width: 2),

                      borderRadius: BorderRadius.circular(20)
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      CircleAvatar(child: Image.network('https://www.oseyo.co.uk/wp-content/uploads/2020/05/empty-profile-picture-png-2-2.png', ),radius:25.0,),
                      SizedBox(height: 20,),

                      Text("NAME"),
                      Text("POST"),
                      SizedBox(height: 20,),

                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context){
                                  return teamDetailsPage();
                                }
                            ),
                          );


                        },
                        child: Text('View'),),
                      SizedBox(height: 20,),




                    ],
                  ),
                ),

                Container(

                  height:225,
                  width: 125,
                  decoration: BoxDecoration(

                      border: Border.all(color: Colors.grey , width: 2),

                      borderRadius: BorderRadius.circular(20)
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      CircleAvatar(child: Image.network('https://www.oseyo.co.uk/wp-content/uploads/2020/05/empty-profile-picture-png-2-2.png', ),radius:25.0,),
                      SizedBox(height: 20,),

                      Text("NAME"),
                      Text("POST"),
                      SizedBox(height: 20,),

                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context){
                                  return teamDetailsPage();
                                }
                            ),
                          );


                        },
                        child: Text('View'),),
                      SizedBox(height: 20,),




                    ],
                  ),
                ),

                Container(

                  height:225,
                  width: 125,
                  decoration: BoxDecoration(

                      border: Border.all(color: Colors.grey , width: 2),

                      borderRadius: BorderRadius.circular(20)
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      CircleAvatar(child: Image.network('https://www.oseyo.co.uk/wp-content/uploads/2020/05/empty-profile-picture-png-2-2.png', ),radius:25.0,),
                      SizedBox(height: 20,),

                      Text("NAME"),
                      Text("POST"),
                      SizedBox(height: 20,),

                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context){
                                  return teamDetailsPage();
                                }
                            ),
                          );


                        },
                        child: Text('View'),),
                      SizedBox(height: 20,),




                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(

                  height:225,
                  width: 125,
                  decoration: BoxDecoration(

                      border: Border.all(color: Colors.grey , width: 2),

                      borderRadius: BorderRadius.circular(20)
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      CircleAvatar(child: Image.network('https://www.oseyo.co.uk/wp-content/uploads/2020/05/empty-profile-picture-png-2-2.png', ),radius:25.0,),
                      SizedBox(height: 20,),

                      Text("NAME"),
                      Text("POST"),
                      SizedBox(height: 20,),

                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context){
                                  return teamDetailsPage();
                                }
                            ),
                          );


                        },
                        child: Text('View'),),
                      SizedBox(height: 20,),




                    ],
                  ),
                ),

                Container(

                  height:225,
                  width: 125,
                  decoration: BoxDecoration(

                      border: Border.all(color: Colors.grey , width: 2),

                      borderRadius: BorderRadius.circular(20)
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      CircleAvatar(child: Image.network('https://www.oseyo.co.uk/wp-content/uploads/2020/05/empty-profile-picture-png-2-2.png', ),radius:25.0,),
                      SizedBox(height: 20,),

                      Text("NAME"),
                      Text("POST"),
                      SizedBox(height: 20,),

                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context){
                                  return teamDetailsPage();
                                }
                            ),
                          );


                        },
                        child: Text('View'),),
                      SizedBox(height: 20,),




                    ],
                  ),
                ),

                Container(

                  height:225,
                  width: 125,
                  decoration: BoxDecoration(

                      border: Border.all(color: Colors.grey , width: 2),

                      borderRadius: BorderRadius.circular(20)
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      CircleAvatar(child: Image.network('https://www.oseyo.co.uk/wp-content/uploads/2020/05/empty-profile-picture-png-2-2.png', ),radius:25.0,),
                      SizedBox(height: 20,),

                      Text("NAME"),
                      Text("POST"),
                      SizedBox(height: 20,),

                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context){
                                  return teamDetailsPage();
                                }
                            ),
                          );


                        },
                        child: Text('View'),),
                      SizedBox(height: 20,),




                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(

                  height:225,
                  width: 125,
                  decoration: BoxDecoration(

                      border: Border.all(color: Colors.grey , width: 2),

                      borderRadius: BorderRadius.circular(20)
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      CircleAvatar(child: Image.network('https://www.oseyo.co.uk/wp-content/uploads/2020/05/empty-profile-picture-png-2-2.png', ),radius:25.0,),
                      SizedBox(height: 20,),

                      Text("NAME"),
                      Text("POST"),
                      SizedBox(height: 20,),

                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context){
                                  return teamDetailsPage();
                                }
                            ),
                          );


                        },
                        child: Text('View'),),
                      SizedBox(height: 20,),




                    ],
                  ),
                ),

                Container(

                  height:225,
                  width: 125,
                  decoration: BoxDecoration(

                      border: Border.all(color: Colors.grey , width: 2),

                      borderRadius: BorderRadius.circular(20)
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      CircleAvatar(child: Image.network('https://www.oseyo.co.uk/wp-content/uploads/2020/05/empty-profile-picture-png-2-2.png', ),radius:25.0,),
                      SizedBox(height: 20,),

                      Text("NAME"),
                      Text("POST"),
                      SizedBox(height: 20,),

                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context){
                                  return teamDetailsPage();
                                }
                            ),
                          );


                        },
                        child: Text('View'),),
                      SizedBox(height: 20,),




                    ],
                  ),
                ),

                Container(

                  height:225,
                  width: 125,
                  decoration: BoxDecoration(

                      border: Border.all(color: Colors.grey , width: 2),

                      borderRadius: BorderRadius.circular(20)
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20,),
                      CircleAvatar(child: Image.network('https://www.oseyo.co.uk/wp-content/uploads/2020/05/empty-profile-picture-png-2-2.png', ),radius:25.0,),
                      SizedBox(height: 20,),

                      Text("NAME"),
                      Text("POST"),
                      SizedBox(height: 20,),

                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context){
                                  return teamDetailsPage();
                                }
                            ),
                          );


                        },
                        child: Text('View'),),
                      SizedBox(height: 20,),




                    ],
                  ),
                ),
              ],
            ),








          ],
        ),
      ),
    );
  }
}
