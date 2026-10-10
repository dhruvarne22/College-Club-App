import 'package:aiem_project/Views/TeamDetailsPage.dart';
import 'package:flutter/material.dart';


class TeamsAndProjectsContainer extends StatelessWidget {

  Map<String, dynamic> Data;

   TeamsAndProjectsContainer({
required this.Data
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(

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
            CircleAvatar(backgroundImage: NetworkImage(Data["thumb"]) ,radius:25.0,),
            SizedBox(height: 20,),

            Text(Data["name"] , style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),
            // Text(Data["isProject"]?"PROJECT":"TEAM"),
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
    );
  }
}
