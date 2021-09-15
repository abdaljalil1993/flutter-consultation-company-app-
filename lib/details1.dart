import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Details1 extends StatefulWidget {
  String id, name, bloodtype, qte;
  Details1(this.id, this.name, this.bloodtype, this.qte);
  @override
  _Details1State createState() => _Details1State();
}

class _Details1State extends State<Details1> {
  Future alloffer() async {
    String url =
        "http://192.168.1.104/hala/send.php?id=${widget.id}&name=${widget.name}&type=${widget.bloodtype}&qte=${widget.qte}";
    var res = await http.get(Uri.parse(url));
    var data = jsonDecode(res.body);
    if (data['result'] == "true") {
      print('done');
      return Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Move Request',
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
      backgroundColor: Color(0xFFCFCECE),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFB99350)),
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  spreadRadius: 2,
                  color: Colors.grey,
                )
              ],
              color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                  onPressed: () {
                    alloffer();
                  },
                  child: Text('move request'))
            ],
          ),
        ),
      ),
    );
  }
}
