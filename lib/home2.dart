import 'package:bactapp/alloffers.dart';
import 'package:bactapp/buy.dart';
import 'package:bactapp/consult.dart';
import 'package:bactapp/partner.dart';
import 'package:bactapp/sell.dart';
import 'package:flutter/material.dart';

class Home2 extends StatelessWidget {
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
      backgroundColor: Color(0xffeaeaea),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  item('All Offers', 'images/More.png', context,
                      new Alloffers()),
                  item('Partnership', 'images/Partnership.png', context,
                      new Partners()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  item('Buy', 'images/Buy.png', context, new Buy()),
                  item('Sell Company', 'images/Sell.png', context, new Sell()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  item('Consultation', 'images/Consulting.png', context,
                      new Consult()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding item(String n, String img, BuildContext f, var t) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: () {
          Navigator.push(f, MaterialPageRoute(builder: (context) => t));
        },
        child: Container(
          padding: EdgeInsets.all(10),
          width: 160,
          height: 155,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFB99350)),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color(0xFF1A2036),
            boxShadow: [
              BoxShadow(spreadRadius: 2, blurRadius: 2, color: Colors.amber)
            ],
          ),
          child: Column(
            children: [
              Image(
                image: AssetImage(img),
                width: 60,
                height: 60,
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 4,
                color: Color(0xFFB99350),
                indent: 20,
                endIndent: 20,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                n,
                style: TextStyle(
                    color: Color(0xFFB99350),
                    fontSize: 21,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      ),
    );
  }
}
