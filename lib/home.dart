import 'package:bactapp/buy.dart';
import 'package:bactapp/consult.dart';
import 'package:bactapp/market.dart';
import 'package:bactapp/other.dart';
import 'package:bactapp/partner.dart';
import 'package:bactapp/sell.dart';

import 'login.dart';
import 'package:flutter/material.dart';
import 'aimn.dart';
import 'alloffers.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
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
          InkWell(
            onTap: () {
              print("clicked");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Alloffers()));
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: GridTile(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.0),
                      color: Color(0xFF222738),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF1A2036).withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(9.0),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage('images/More.png'),
                          height: 100,
                          width: 100,
                        )
                      ],
                    ),
                  ),
                  footer: Container(
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    child: Text(
                      "All Offers",
                      style: TextStyle(color: Color(0xFF1A2036), fontSize: 17),
                    ),
                    color: Color(0xFFB99350),
                  )),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Partners()));
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: GridTile(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.0),
                      color: Color(0xFF222738),
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
                        Image(
                          image: AssetImage('images/Partnership.png'),
                          height: 100,
                          width: 100,
                        )
                      ],
                    ),
                  ),
                  footer: Container(
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    child: Text(
                      "Partner Ship",
                      style: TextStyle(color: Color(0xFF1A2036), fontSize: 17),
                    ),
                    color: Color(0xFFB99350),
                  )),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Buy()));
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: GridTile(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.0),
                      color: Color(0xFF222738),
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
                        Image(
                          image: AssetImage('images/Buy.png'),
                          height: 100,
                          width: 100,
                        )
                      ],
                    ),
                  ),
                  footer: Container(
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    child: Text(
                      "Buy ",
                      style: TextStyle(color: Color(0xFF1A2036), fontSize: 17),
                    ),
                    color: Color(0xFFB99350),
                  )),
            ),
          ),
          InkWell(
            onTap: () {
              print("clicked");
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Sell()));
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                height: 140,
                child: GridTile(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.0),
                        color: Color(0xFF222738),
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
                          Image(
                            image: AssetImage('images/Sell.png'),
                            height: 100,
                            width: 100,
                          )
                        ],
                      ),
                    ),
                    footer: Container(
                      padding: EdgeInsets.all(8),
                      alignment: Alignment.center,
                      child: Text(
                        "Sell Company",
                        style:
                            TextStyle(color: Color(0xFF1A2036), fontSize: 17),
                      ),
                      color: Color(0xFFB99350),
                    )),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Consult()));
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: GridTile(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.0),
                      color: Color(0xFF222738),
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
                        Image(
                          image: AssetImage('images/Consulting.png'),
                          height: 100,
                          width: 100,
                        )
                      ],
                    ),
                  ),
                  footer: Container(
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    child: Text(
                      "Get Consultation",
                      style: TextStyle(color: Color(0xFF1A2036), fontSize: 17),
                    ),
                    color: Color(0xFFB99350),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
