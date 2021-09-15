import 'login.dart';
import 'package:flutter/material.dart';
import 'aimn.dart';
import 'alloffers.dart';

class Other extends StatefulWidget {
  @override
  _OtherState createState() => _OtherState();
}

class _OtherState extends State<Other> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BACT Services',
          style: TextStyle(color: Color(0xFFB99350), fontSize: 30.0),
        ),
        centerTitle: true,
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/logo.png'),
          backgroundColor: Color(0xFF1A2036),
          maxRadius: 22.0,
        ),
        backgroundColor: Color(0xFF1A2036),
      ),
      backgroundColor: Colors.white,
      body: GridView(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: [
          serv(context, 'images/folder.png', 'Bank Account'),
          serv(context, 'images/1.jpg', 'Markiting '),
          serv(context, 'images/11.jpg', 'Consultation'),
          serv(context, 'images/111.jpg', 'Medical Services'),
          serv(context, 'images/1111.jpg', 'Education'),
          serv(context, 'images/clipboard.png', 'Company Management'),
          serv(context, 'images/ee.png', 'Trading Advise'),
        ],
      ),
    );
  }

  InkWell serv(BuildContext context, String img, String servicename) {
    return InkWell(
      onTap: () {
        print("clicked");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Alloffers()));
      },
      child: Padding(
        padding: EdgeInsets.all(10),
        child: GridTile(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.0),
                color: Color(0xFF565C72),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF1A2036).withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              height: 80.0,
              alignment: Alignment.center,
              padding: EdgeInsets.all(9.0),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(img),
                    maxRadius: 80.0,
                    backgroundColor: Color(0xFF1A2036),
                  ),
                ],
              ),
            ),
            footer: Container(
              padding: EdgeInsets.all(8),
              alignment: Alignment.center,
              child: Text(
                servicename,
                style: TextStyle(color: Color(0xFF1A2036), fontSize: 17),
              ),
              color: Color(0xFFB99350),
            )),
      ),
    );
  }
}
