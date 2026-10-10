import 'package:aiem_project/Views/home.dart';
import 'package:aiem_project/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Forgot Password"),
      content: Text("Mail us at theaiem.vitb@gmail.com.\nOur team will generate a new password for your ID."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  TextEditingController emailTextEditingController =
      new TextEditingController();
  TextEditingController passTextEditingController = new TextEditingController();

  VerifyLoginCred(String email, String password) async {
    print(email.toLowerCase());
    await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: email.toLowerCase())
        .get()
        .then((value) async {
//TODO:Create A Msg if document is not found
//TODO:MAKE IT GENERAL
      Map<String, dynamic> userData;
      userData = value.docs[0].data();

      print(userData);
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.toLowerCase(), password: password);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Home(
                    UserData: userData,
                  )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.asset("assets/logo/AIEM_LOGO.png"),
            width: 140,
            height: 140,
          ),
          Container(
            child: Text(
              "LOGIN TO AIEM APP",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Container(
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.black45)),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      controller: emailTextEditingController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Your Mail"),
                    )),
                SizedBox(
                  height: 12,
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.black45)),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      controller: passTextEditingController,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Your Password"),
                    )),
              ],
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 35),
              child: SizedBox(
                  width: 10,
                  child: TextButton(
                    child: Text("Forgot Password",
                        style: TextStyle(
                            color: Colors.purple, fontWeight: FontWeight.w700)),
                    onPressed: () {
                      showAlertDialog(context);
                    },
                  ))),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: ElevatedButton(
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(5.0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.purpleAccent)))),
                onPressed: () async {
                  VerifyLoginCred(emailTextEditingController.text,
                      passTextEditingController.text);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shield),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        "LOGIN SECURELY",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
