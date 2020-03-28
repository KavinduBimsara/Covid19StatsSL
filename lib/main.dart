import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: Covoid19Stats(),
  ));
}

class Covoid19Stats extends StatefulWidget {
  @override
  Covoid19State createState() => Covoid19State();
}

class Covoid19State extends State<Covoid19Stats> {
  final String urlLK = "https://thevirustracker.com/free-api?countryTotal=LK";
  List data;
  final String urlGlobal =
      "https://thevirustracker.com/free-api?countryTotal=LK";


  Future<String> getSWData() async {
    var dataLK = await http
        .get(Uri.parse(urlLK), headers: {"Accept": "application/json"});

    setState(() {
      var resBody = json.decode(dataLK.body);
      data = resBody["countrydata"];
    });

    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid-19 Stats Sri Lanka"),
        
        backgroundColor: Colors.black87,
      ),
      body:Center(
        
          child: ListView.builder(
            
            itemCount: data == null ? 0 : data.length,
            
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Card(
                        child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Total cases LK: "),
                                Text(data[0]["total_cases"].toString(),
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.black87)),
                              ],
                            )),
                      ),
                                            Card(
                          child: Container(
                              padding: EdgeInsets.all(15.0),
                                child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.center,

                                  children: <Widget>[
                                    Text("Total active cases LK: "),
                                    Text(data[0]["total_active_cases"].toString(),
                                        style: TextStyle(
                                            fontSize: 18.0, color: Colors.black87)),
                                  ],
                                )
                                ),
                      ),
                                            Card(
                        child: Container(
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,

                              children: <Widget>[
                                Text("Total serious cases LK: "),
                                Text(data[0]["total_serious_cases"].toString(),
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.black87)),
                              ],
                            )),
                      ),
                      Card(
                        child: Container(
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,

                              children: <Widget>[
                                Text("Total recovered LK: "),
                                Text(data[0]["total_recovered"].toString(),
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.black87)),
                              ],
                            )),
                      ),
                      Card(
                        child: Container(
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,

                              children: <Widget>[
                                Text("Total deaths LK: "),
                                Text(data[0]["total_deaths"].toString(),
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.black87)),
                              ],
                            )),
                      ),
                      Card(
                        child: Container(
                            padding: EdgeInsets.all(15.0),
                            child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,

                              children: <Widget>[
                                Text("Total new cases today: "),
                                Text(data[0]["total_new_cases_today"].toString(),
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.black87)),
                              ],
                            )),
                      ),


                      
                    ],
                  ),
                ),
              );
            },
          ),
          
      
    ),

    );
  }

  @override
  void initState() {
    super.initState();
    this.getSWData();
  }
}

