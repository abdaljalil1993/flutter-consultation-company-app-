import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Details extends StatefulWidget {
  String id;
  Details(this.id);
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  var item = [];
  Future alloffer() async {
    String url =
        "https://htsy2019.000webhostapp.com/bact/api/getoffers.php?id=${widget.id}";
    var res = await http.get(Uri.parse(url));
    var data = jsonDecode(res.body);
    setState(() {
      item = data;
    });

    print(item);
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
          'Company Details',
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
              Text(
                'Company Name :' + item[0]['companyname'],
                style: TextStyle(color: Color(0xFFB99350), fontSize: 30),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 14,
              ),
              Divider(
                height: 2,
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                'Company Legal Activity :' + item[0]['legalactivity'],
                style: TextStyle(fontSize: 21),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 2,
              ),
              SizedBox(
                height: 19,
              ),
              Text(
                'Date Of Start  :' + item[0]['sd'],
                style: TextStyle(fontSize: 21),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 2,
              ),
              SizedBox(
                height: 19,
              ),
              Text(
                'Number Of Local Employee :' + item[0]['localemp'],
                style: TextStyle(fontSize: 21),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 2,
              ),
              SizedBox(
                height: 19,
              ),
              Text(
                'Number Of Online Employee:' + item[0]['onlineemp'],
                style: TextStyle(fontSize: 21),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 2,
              ),
              SizedBox(
                height: 19,
              ),
              Text(
                'Company Fixed Assets :' + item[0]['fixedassets'],
                style: TextStyle(fontSize: 21),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 2,
              ),
              SizedBox(
                height: 19,
              ),
              Text(
                'Company Profits :' + item[0]['companyprofits'],
                style: TextStyle(fontSize: 21),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 2,
              ),
              SizedBox(
                height: 19,
              ),
              Text(
                'Company Insurance :' + item[0]['companyinsurance'],
                style: TextStyle(color: Color(0xFFB99350), fontSize: 24),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 2,
              ),
              SizedBox(
                height: 19,
              ),
              Text(
                'Number Of Partners:' + item[0]['nop'],
                style: TextStyle(fontSize: 21),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 2,
              ),
              SizedBox(
                height: 19,
              ),
              Text(
                'Branch To Be Found :' + item[0]['brunches'],
                style: TextStyle(color: Color(0xFFB99350), fontSize: 24),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 2,
              ),
              SizedBox(
                height: 19,
              ),
              Text(
                'Branches Location :' + item[0]['brancheslocation'],
                style: TextStyle(fontSize: 21),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 2,
              ),
              SizedBox(
                height: 19,
              ),
              Text(
                'Average Bank Account  :' + item[0]['bankaccount'],
                style: TextStyle(color: Color(0xFFB99350), fontSize: 24),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 2,
              ),
              SizedBox(
                height: 19,
              ),
              Text(
                'Does the Company Have Policy:' + item[0]['policy'],
                style: TextStyle(fontSize: 21),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 2,
              ),
              SizedBox(
                height: 22,
              ),
              Text(
                'Tax Cost :' + item[0]['taxcost'],
                style: TextStyle(color: Color(0xFFB99350), fontSize: 24),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 2,
              ),
              SizedBox(
                height: 19,
              ),
              Text(
                'Tax Changed Area :' + item[0]['taxarea'],
                style: TextStyle(fontSize: 21),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 2,
              ),
              SizedBox(
                height: 19,
              ),
              Text(
                'Date Of Join :' + item[0]['doj'],
                style: TextStyle(fontSize: 21),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 2,
              ),
              SizedBox(
                height: 19,
              ),
              Text(
                'Company Market Value :' + item[0]['marketvalue'],
                style: TextStyle(color: Color(0xFFB99350), fontSize: 24),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 2,
              ),
              SizedBox(
                height: 19,
              ),
              Text(
                'Property Brand :' + item[0]['propertybrand'],
                style: TextStyle(fontSize: 21),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 2,
              ),
              SizedBox(
                height: 19,
              ),
              Text(
                'Current Contract  :' + item[0]['currentcontract'],
                style: TextStyle(color: Color(0xFFB99350), fontSize: 24),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 2,
              ),
              SizedBox(
                height: 19,
              ),
              Text(
                'Contract Value :' + item[0]['contractvalue'],
                style: TextStyle(fontSize: 21),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 2,
              ),
              SizedBox(
                height: 19,
              ),
              Text(
                'Duration Of Contract :' + item[0]['contractduration'],
                style: TextStyle(fontSize: 21),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 2,
              ),
              SizedBox(
                height: 19,
              ),
              Text(
                'The Remine  Value:' + item[0]['reminevalue'],
                style: TextStyle(fontSize: 21),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 2,
              ),
              SizedBox(
                height: 19,
              ),
              Row(
                children: [
                  Text(
                    'Financial Report  :',
                    style: TextStyle(color: Color(0xFFB99350), fontSize: 24),
                  ),
                  Expanded(
                    child: Image(
                      image: NetworkImage(
                          "https://htsy2019.000webhostapp.com/bact/admin/financial/" +
                              item[0]['financialreport']),
                      height: 250,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 2,
              ),
              SizedBox(
                height: 19,
              ),
              Text(
                'Optain To Add Unlimited Year :' + item[0]['unlimitedyear'],
                style: TextStyle(fontSize: 21),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 2,
              ),
              SizedBox(
                height: 19,
              ),
              Row(
                children: [
                  Text(
                    'License Photo :',
                    style: TextStyle(color: Color(0xFFB99350), fontSize: 24),
                  ),
                  Expanded(
                    child: Image(
                      image: NetworkImage(
                          "https://htsy2019.000webhostapp.com/bact/admin/license/" +
                              item[0]['licensephoto']),
                      height: 250,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 2,
              ),
              SizedBox(
                height: 19,
              ),
              Text(
                'Customers Insurance :' + item[0]['customersinsurance'],
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                height: 2,
              ),
              SizedBox(
                height: 19,
              ),
              Text(
                'Offer Type :' + item[0]['type'],
                style: TextStyle(color: Color(0xFFB99350), fontSize: 24),
              ),
              SizedBox(
                height: 19,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
