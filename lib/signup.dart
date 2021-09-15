import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'login.dart';
import 'dart:convert';
import 'aimn.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController e1 = TextEditingController();
  TextEditingController e2 = TextEditingController();
  String ertext = '';
  var f = GlobalKey<FormState>();

  Future userlogin() async {
    var respones = await http.post(
        Uri.parse("https://htsy2019.000webhostapp.com/bact/api/signup.php"),
        body: {'email': e1.text, 'pass': e2.text});
    var data = jsonDecode(respones.body);
    if (data['result'] == "true") {
      print(data);
      Navigator.of(context).push(Anim(Page: Login()));
    } else {
      er();
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
          ' Create acount',
          style: TextStyle(color: Color(0xFFB99350), fontSize: 25.0),
        ),
        centerTitle: true,
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/logo.png'),
          backgroundColor: Color(0xFF1A2036),
          radius: 20.0,
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
                  left: 28.0, right: 28.0, top: 13.0, bottom: 30.0),
              child: ListView(
                children: [
                  SizedBox(
                    height: 23.0,
                  ),
                  Text(
                    'SignUp',
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
                  Form(
                    key: f,
                    child: Column(
                      children: [
                        TextFormField(
                          autofocus: true,
                          validator: (String value) {
                            if (value.isEmpty) return 'enter your Name';
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'Name',
                            hintText: 'ex : Ameer',
                            labelStyle: TextStyle(color: Color(0xFFB99350)),
                            errorStyle: TextStyle(color: Colors.red),
                          ),
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        TextFormField(
                          autofocus: true,
                          validator: (String value) {
                            if (value.isEmpty) return 'enter your phone please';
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'phone number',
                            hintText: 'ex : +97128535888',
                            labelStyle: TextStyle(color: Color(0xFFB99350)),
                            errorStyle: TextStyle(color: Colors.red),
                          ),
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        TextFormField(
                          autofocus: true,
                          validator: (String value) {
                            if (value.isEmpty) return 'enter your Email';
                          },
                          controller: e1,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'Email',
                            hintText: 'ex :example@ex.com',
                            labelStyle: TextStyle(color: Color(0xFFB99350)),
                            errorStyle: TextStyle(color: Colors.red),
                          ),
                        ),
                        SizedBox(
                          height: 12.0,
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
                          height: 12.0,
                        ),
                        TextFormField(
                          autofocus: true,
                          validator: (String value) {
                            if (value.isEmpty)
                              return 'enter your Address please';
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'Address',
                            hintText: 'ex :Dubai -Alaamal Street',
                            labelStyle: TextStyle(color: Color(0xFFB99350)),
                            errorStyle: TextStyle(color: Colors.red),
                          ),
                        ),
                        SizedBox(
                          height: 19.0,
                        ),
                        ElevatedButton(
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
                            child: Text('Save',
                                style: TextStyle(
                                    color: Color(0xFF1A2036), fontSize: 23.0)),
                          ),
                        ),
                        SizedBox(
                          height: 18.0,
                        ),
                        InkWell(
                            child: Text(
                              'back to login',
                              style: TextStyle(
                                  color: Color(0xFFB99350), fontSize: 19.0),
                            ),
                            onTap: () {
                              Navigator.of(context).push(Anim(Page: Login()));
                            }),
                        Text(ertext, style: TextStyle(color: Colors.red)),
                        SizedBox(
                          height: 10.0,
                        ),
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
                '** BACT  2021 **',
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
