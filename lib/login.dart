import 'dart:convert';

import 'package:bactapp/home2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';
import 'signup.dart';
import 'package:http/http.dart' as http;
import 'aimn.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController e1 = TextEditingController();
  TextEditingController e2 = TextEditingController();
  String ertext = '';
  var f = GlobalKey<FormState>();
  var xx = '';

  Future userlogin() async {
    print(e1.text);
    print(e2.text);
    Uri u = Uri.parse(
        "https://htsy2019.000webhostapp.com/bact/api/login.php?email=${e1.text}&pass=${e2.text}");
    //Uri u = Uri.parse('https://htsy2019.000webhostapp.com/bact/api/login.php');

    //var data = jsonEncode({'email': e1.text, 'pass': e2.text});
    var respones = await http.get(u);

    var data1 = jsonDecode(respones.body);

    if (respones.statusCode == 200) {
      print(respones.body.toString());
      if (data1['result'] == "true")
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home2()));
      else
        print('ddddddddddddd');
    } else {
      print("opsssssssssss");
    }
  }

  void er() {
    setState(() {
      ertext = 'password wrong';
      e1.text = '';
      e2.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BACT Consultation',
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
      body: Builder(
        builder: (context) => Container(
            decoration: BoxDecoration(),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 28.0, right: 28.0, top: 33.0, bottom: 30.0),
              child: ListView(
                children: [
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 25, color: Color(0xFFB99350)),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Join Us To Join Success',
                    style: TextStyle(fontSize: 19, color: Color(0xFFB99350)),
                  ),
                  SizedBox(
                    height: 28.0,
                  ),
                  Text('$xx'),
                  Form(
                    key: f,
                    child: Column(
                      children: [
                        TextFormField(
                          autofocus: true,
                          controller: e1,
                          validator: (String value) {
                            if (value.isEmpty) return 'enter your email please';
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'Email',
                            hintText: 'ex : ameer@gmail.com',
                            labelStyle: TextStyle(color: Color(0xFFB99350)),
                            errorStyle: TextStyle(color: Colors.red),
                          ),
                        ),
                        SizedBox(
                          height: 19.0,
                        ),
                        TextFormField(
                          autofocus: true,
                          validator: (String value) {
                            if (value.isEmpty)
                              return 'enter your password please';
                          },
                          controller: e2,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'Password',
                            hintText: 'ex : ********',
                            labelStyle: TextStyle(color: Color(0xFFB99350)),
                            errorStyle: TextStyle(color: Colors.red),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed))
                                    return Color(0xFFB99350);
                                  return Color(
                                      0xFFB99350); // Use the component's default.
                                },
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (f.currentState.validate()) {
                                  userlogin();
                                }
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Log In',
                                  style: TextStyle(
                                      color: Color(0xFF1A2036),
                                      fontSize: 23.0,
                                      backgroundColor: Color(0xFFB99350))),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(ertext, style: TextStyle(color: Colors.red)),
                        SizedBox(
                          height: 10.0,
                        ),
                        InkWell(
                            child: Text(
                              'New Member? Create new account',
                              style: TextStyle(
                                  color: Color(0xFFB99350), fontSize: 20.0),
                            ),
                            onTap: () {
                              Navigator.of(context).push(Anim(Page: Signup()));
                            })
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Row(
          children: [
            Container(
              height: 50.0,
              color: Color(0xFF1A2036),
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Text(
                'Powered By BACT 2021 ',
                style: TextStyle(
                  color: Color(0xFFB99350),
                  fontSize: 19.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
