import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GetInTouchContainer extends StatelessWidget {
  const GetInTouchContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.grey,
            height: 2,
            width: 270,
          ),
          //Club Logo
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 70,
              width: 70,
              child: Image.network('https://media-exp1.licdn.com/dms/image/C4D0BAQFsyOaLBZslpA/company-logo_100_100/0/1643462814987?e=1655942400&v=beta&t=Mtx0llqb-B3oHpgP73U5xEuH8sDltg_EvAg1Cqx4hJE'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("TEAM AIEM" , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
          ),
          Text("GET IN TOUCH" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.instagram)),
                IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.whatsapp)),
                IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.linkedin)),
                IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.envelope)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
