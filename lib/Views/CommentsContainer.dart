import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentsContainer extends StatelessWidget {
  const CommentsContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 200,
        width: 350,
        decoration: BoxDecoration(

            border: Border.all(color: Colors.grey , width: 2),

            borderRadius: BorderRadius.circular(10)
        ),


        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Container for the image of the commentor

                  CircleAvatar(child: Image.network('https://www.oseyo.co.uk/wp-content/uploads/2020/05/empty-profile-picture-png-2-2.png'), radius: 17.0,),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text('Ujjwal Srivastav', style: TextStyle(fontWeight: FontWeight.bold),),
                      Text('On Insatgram'),
                    ],
                  ),
                ],
              ),
               Padding(
                 padding: const EdgeInsets.all(4.0),
                 child: Container(width: 250, height: 2, color: Colors.grey,),
               ),
               Text('"It was an amazing event.."', style: TextStyle(fontSize: 19), ),


            ],

          ),
        ),
      ),
    );
  }
}
