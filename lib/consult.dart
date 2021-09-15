import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Consult extends StatefulWidget {
  @override
  _ConsultState createState() => _ConsultState();
}

class _ConsultState extends State<Consult> {
  TextEditingController name, email, type, des;

  String url = "https://htsy2019.000webhostapp.com/bact/api/consult.php";

  Future consult() async {
    var res = await http.post(Uri.parse(url), body: {
      'name': name.text,
      'email': email.text,
      'type': type.text,
      'des': des.text
    });
    var data = jsonDecode(res.body);
    setState(() {
      if (data['f'] == true) {
        name.text = "";
        email.text = "";
        type.text = "";
        des.text = "";
        return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text('consultation sent successfully'),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('OK'))
                ],
              );
            });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    name = new TextEditingController();
    email = new TextEditingController();

    type = new TextEditingController();
    des = new TextEditingController();
    super.initState();
  }

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
      backgroundColor: Color(0xFFCECCCC),
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
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.85,
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
                color: Color(0xFFE9E8E8)),
            child: Column(
              children: [
                Text(
                  'Get Your Free Consultation',
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
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          gapPadding: 3),
                      labelText: 'Name',
                      hintText: 'enter your name'),
                  controller: name,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          gapPadding: 3),
                      labelText: 'email',
                      hintText: 'enter your email'),
                  controller: email,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          gapPadding: 3),
                      labelText: 'Consultation Type',
                      hintText:
                          'Consultation Type ,marketing,financial,management....'),
                  controller: type,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          gapPadding: 3),
                      labelText: 'short Description',
                      hintText: 'Description'),
                  controller: des,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: InkWell(
                      child: Text(
                        'Submit ',
                        style: TextStyle(fontSize: 21),
                      ),
                      onTap: () {
                        consult();
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
