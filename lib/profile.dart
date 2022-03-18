import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:data_parsing/sample_json.dart';
import 'package:flutter/services.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Profile> {
  late String _name = "";
  late String _age = "";
  late String _username = "";
  late String _repo = "";
  List _hobi = [];

  Future _loadSampleJson() async {
    String jsonString = await rootBundle.loadString("assets/sample.json");
    final jsonData = json.decode(jsonString);
    Sample sample = Sample.fromJson(jsonData);

    setState(() {
      _name = sample.name.toString();
      _age = sample.age.toString();
      _username = sample.github!.username.toString();
      _repo = sample.github!.repository.toString();
      _hobi = sample.hobi!.toList();
    });
  }

  void initState() {
    _loadSampleJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 40.0),
          child: ListView(
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Profile Details",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 15)),
              Container(
                width: 400,
                height: 300,
                decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("assets/img/tema.png")),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 25)),
              Container(
                width: 400,
                height: 210,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Colors.deepPurple,
                        Colors.deepPurpleAccent
                      ],
                    ),
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 50)),
                    Container(
                      padding: EdgeInsets.all(21),
                      width: 380,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white)),
                      child: Text(
                        "Nama : " + _name,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(21),
                      width: 380,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white)),
                      child: Text(
                        "Umur : " + _age,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            padding: EdgeInsets.all(50),
                            width: 120.0,
                            height: 120.0,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 155, 121, 0),
                                borderRadius: BorderRadius.circular(15)),
                            child: Text("Articles")),
                        Container(
                            padding: EdgeInsets.all(50),
                            width: 120.0,
                            height: 120.0,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 155, 121, 0),
                                borderRadius: BorderRadius.circular(15)),
                            child: Text("Articles")),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.all(50),
                          width: 120.0,
                          height: 120.0,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 71, 201, 140),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text("Contact"),
                        ),
                        Container(
                          padding: EdgeInsets.all(50),
                          width: 120.0,
                          height: 120.0,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 71, 201, 140),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text("Contact"),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 24.0),
                      height: MediaQuery.of(context).size.height * 0.30,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _hobi.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Card(
                                color: Colors.green,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.purpleAccent,
                                        Colors.deepPurpleAccent
                                      ],
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 1,
                                          blurRadius: 5,
                                          offset: Offset(0, 1))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    GestureDetector(
                      onTap: () {
                        _loadSampleJson();
                      },
                      child: Container(
                        height: 50,
                        width: 250,
                        color: Colors.lightBlueAccent,
                        alignment: Alignment.center,
                        child: const Text(
                          "See Profile",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
