import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Sell extends StatefulWidget {
  @override
  _SellState createState() => _SellState();
}

class _SellState extends State<Sell> {
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
      body: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xFF101422),
              Color(0xFF5A5E70),
              Color(0xFF051352),
            ])),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.99,
            height: 360,
            alignment: Alignment.center,
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFB99350)),
                borderRadius: BorderRadius.all(Radius.circular(9)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    spreadRadius: 2,
                    color: Colors.grey,
                  )
                ],
                color: Colors.white),
            child: Column(
              children: [
                Text(
                  'You Want To Offer You Company For Sell Or Partnership ??',
                  style: TextStyle(color: Color(0xFFB99350), fontSize: 26),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  height: 3,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: InkWell(
                      child: Text(
                        'Click To Make Your Offer Please',
                        style: TextStyle(fontSize: 21),
                      ),
                      onTap: () {
                        launch(
                            "https://htsy2019.000webhostapp.com/bact/admin/add.php");
                      },
                    )),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  height: 3,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'BACT Consultation',
                  style: TextStyle(color: Color(0xFFB99350), fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
