import 'package:flutter/material.dart';

class TaskHistory extends StatelessWidget {
  const TaskHistory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:1, vertical: 10),
      decoration: BoxDecoration(

          border: Border.all(color: Colors.grey , width: 2),

          borderRadius: BorderRadius.circular(20)
      ),
      child: SizedBox(
        height: 300,
        child: ListView.separated(
            shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context , index){
              return ListTile(
                title: Text("Participated in AIEM Event"),
                subtitle: Text("22 March"),
                trailing: Text("+5 Credits" ,style: TextStyle(fontWeight: FontWeight.bold),),
              );
            }, separatorBuilder: (context , index){
          return Divider();
        }, itemCount: 8),
      ),

    );
  }
}
