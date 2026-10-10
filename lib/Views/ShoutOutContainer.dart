import 'package:flutter/material.dart';

class ShoutOutContainer extends StatelessWidget {
  const ShoutOutContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.center ,

        children: [
          // Shoutout Heading Text
          Container(
              padding : EdgeInsets.all(15),
              width : MediaQuery.of(context).size.width,
              child: Text("A BIG SHOUTOUT TO" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold), textAlign: TextAlign.left,),),
          Container(
            margin: EdgeInsets.symmetric(horizontal:10, vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 5 , vertical: 20),
            decoration: BoxDecoration(

                border: Border.all(color: Colors.grey , width: 2),

                borderRadius: BorderRadius.circular(20)
            ),
            child: Row(
              children: [
                // Details of the person be shouted out
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.purple,
                    radius: 40,
                  )),
                //Divider line
                Container(width: 2, height: 80, color: Colors.grey,),
                //Name and other details of the person
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Name text of the person
                      Container(

                          child: Text("ROHIT SHARMA" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold), textAlign: TextAlign.left,)),
                      Text('For earning the highest credit '),
                      Text('in this week, 120 CREDITS'),
                      //Button to view profile
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(width: 100, height: 25,child: ElevatedButton(onPressed: (){}, child: Text('View Profile',style: TextStyle(fontSize: 10 ,),),)),
                      ),

                    ],
                  ),
                ),


              ],

            ),

          ),
        ],),
    );
  }
}