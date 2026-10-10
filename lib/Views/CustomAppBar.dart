import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {


  AnimationController animationController;
  Animation colorsTween, homeTween, yogaTween, iconTween,drawerTween;
  Function()? onPressed;
  String UserImgUrl;

  CustomAppBar({
    required this.animationController,
    required this.colorsTween,
    required this.drawerTween,
    required this.homeTween,
    required this.iconTween,
    required this.onPressed,
    required this.yogaTween,
    required this.UserImgUrl
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context,child)=>AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.dehaze,
              color: drawerTween.value,
            ),
            onPressed: onPressed,

          ),
          backgroundColor: colorsTween.value,
          elevation: 0,
          title: Row(
            children: [
              Text("THE AIEM " , style: TextStyle(
                  color: homeTween.value,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),),
              Text("CLUB", style: TextStyle(
                  color: yogaTween.value,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),)
            ],
          ),
          actions: [
            Icon(Icons.notifications , color: iconTween.value,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(UserImgUrl),
              ),
            )
          ],
        ),
      ),
    );
  }}