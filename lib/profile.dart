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
  late String _name = "";
  late String _age = "";
  late String _hobi = "";
  late String _username = "";
  late String _repo = "";
  Future _loadJson() async {
    String jsonString = await rootBundle.loadString("assets/sample.json");
    final jsonData = json.decode(jsonString);
    Sample sample = Sample.fromJson(jsonData);
    setState(() {
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
          child: ListView(
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Profile Details",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    image: DecorationImage(
                        image: AssetImage('assets/img/profile.png'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 15)),
              Container(
                width: 500,
                height: 500,
                child: Column(
                  children: [
                    Container(
                      width: 150,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white)),
                      child: Text("Nama"),
                    ),
                    Container(
                      width: 150,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white)),
                      child: Text("Umur"),
                    ),
                    Container(
                      width: 150,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white)),
                      child: Text("Hobi"),
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
