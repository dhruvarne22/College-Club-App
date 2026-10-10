import 'package:flutter/material.dart';

class UpcomingEventsContainer extends StatelessWidget {
  List<Map<String, dynamic>> UpcomingEvents;
  UpcomingEventsContainer({
    required this.UpcomingEvents
});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:5, vertical: 10),
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
                title: Text(UpcomingEvents[index]["event_name"]),
                subtitle: Text(UpcomingEvents[index]["event_date_n_time"].toString()),
                trailing: Text(UpcomingEvents[index]["isPaid"] ? "Rs. ${UpcomingEvents[index]["fees"]}" : "Free" ,style: TextStyle(fontWeight: FontWeight.bold),),

              );
            }, separatorBuilder: (context , index){
          return Divider();
        }, itemCount: UpcomingEvents.length),
      ),

    );
  }
}
