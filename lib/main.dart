import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuilsXontext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  } 
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String _jsonContent = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text('Read Json'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisAlignment.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDoctor(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 150,
                      color: Colors.grey,
                      alignment: Alignment.center,
                      child: const Text('Read JSON File'),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInset.only(top: 12.0),
                child: Text(
                  _jsonContent,
                  TextAlign: TextAlign.center,
                ),
              ),
            ],
          ), 
        ),
      ),
    );
  }
}