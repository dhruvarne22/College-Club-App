import 'package:flutter/material.dart';

import 'DrawerTextButtonContainer.dart';

class teamDetailsPage extends StatefulWidget {
  const teamDetailsPage({Key? key}) : super(key: key);

  @override
  _teamDetailsPageState createState() => _teamDetailsPageState();
}

class _teamDetailsPageState extends State<teamDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TEAM ROBOCON'),),
      body: Column(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(8),

            scrollDirection: Axis.horizontal,

            child: Row(

              children: [
                SizedBox(width:8),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey , width: 2),
                      borderRadius: BorderRadius.circular(15)),
                    child: Image.network('https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg', height: 150, width: 350,)),
                SizedBox(width:15),
                Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey , width: 2),
                        borderRadius: BorderRadius.circular(15)),
                    child: Image.network('https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg', height: 150, width: 350,)),
                SizedBox(width:15),
                Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey , width: 2),
                        borderRadius: BorderRadius.circular(15)),
                    child: Image.network('https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg', height: 150, width: 350,)),

              ],

            ),

          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(

              children: [
                Row(
                  children: [
                    Text('Published on - 20 January, 2020'),

                  ],
                ),
                Row(
                  children: [
                    Text('By - '),
                    TextButton(onPressed: (){}, child:Text('Aman Kumar'),)
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Row(children: [
                Text('Explanation text will go here'),



    ],
    ),



),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text('YOU MAY ALSO LIKE', style: kHeadingTextStyle,textAlign: TextAlign.left,),),
        ],
      ),
    );
  }
}
