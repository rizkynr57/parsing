import 'package:flutter/material.dart';
import 'package:data_parsing/sample_json.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Profile> {
  late String _jsonContent = "";
  late String _name = "";
  late String _age = "";
  late String _hobi = "";
  late String _username = "";
  late String _repo = "";
  Future _loadSampleJson() async {
    String jsonString = await rootBundle.loadString("assets/sample.json");
    final jsonData = json.decode(jsonString);
    Sample sample = Sample.fromJson(jsonData);
    setState(() {
      _jsonContent = sample.toString();
      _name = sample.name.toString();
      _age = sample.age.toString();
      _hobi = sample.hobi.toString();
      _username = sample.github!.username.toString();
      _repo = sample.github!.repository.toString();
    });
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
                height: 250,
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
                      padding: EdgeInsets.all(10),
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
                      padding: EdgeInsets.all(10),
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
                    Container(
                      padding: EdgeInsets.all(10),
                      width: 380,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white)),
                      child: Text(
                        "Hobi : " + _hobi,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
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