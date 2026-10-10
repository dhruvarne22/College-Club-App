import 'package:flutter/material.dart';
class AIEMNotification extends StatefulWidget {
  const AIEMNotification({Key? key}) : super(key: key);

  @override
  _AIEMNotificationState createState() => _AIEMNotificationState();
}

class _AIEMNotificationState extends State<AIEMNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
      body: ListView.builder(itemCount: 20,itemBuilder: (context,index){
        return ListTile(
            leading: Icon(Icons.emoji_emotions),
            title: Text("You earend 5 Credits"),
            subtitle: Text("Participated In Webinar"),
            trailing : Text("+5 Credits")

        );
      }),
    );
  }
}
