import 'dart:convert';

import 'package:bactapp/details.dart';
import 'package:bactapp/details1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Allreq extends StatefulWidget {
  @override
  _AllreqState createState() => _AllreqState();
}

class _AllreqState extends State<Allreq> {
  String url = "http://192.168.1.104/hala/alloffers.php";
  var item = [];
  Future alloffer() async {
    var res = await http.get(Uri.parse(url));
    var data = jsonDecode(res.body);
    setState(() {
      item = data;
    });
  }

  @override
  void initState() {
    alloffer();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Requests',
          style: TextStyle(color: Color(0xFFB99350), fontSize: 30.0),
        ),
        centerTitle: true,
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/More.png'),
          backgroundColor: Color(0xFF1A2036),
          maxRadius: 22.0,
        ),
        backgroundColor: Color(0xFF1A2036),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: item.length,
          itemBuilder: (context, i) {
            return listitem(item[i]['name'], item[i]['bloodtype'],
                item[i]['qte'], item[i]['id']);
          },
        ),
      ),
    );
  }

  Widget listitem(String id, String name, String type, String qte) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Details1(id, name, type, qte)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFB99350)),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                spreadRadius: 2,
                blurRadius: 3,
                color: Color(0xFFB99350),
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(2),
            child: ListTile(
              title: Text(
                name,
                style: TextStyle(fontSize: 25, color: Color(0xFF1A2036)),
              ),
              subtitle: Text(
                type,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              leading: Image(
                image: NetworkImage("images/More.png"),
                width: 80,
                height: 80,
              ),
              trailing: Icon(
                Icons.arrow_right,
                size: 28,
                color: Color(0xFF1A2036),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
