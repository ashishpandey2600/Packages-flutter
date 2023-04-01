import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController Controller = TextEditingController();

  void saveText(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("text", text);
  }

  void readText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedValue = prefs.getString("text");
    if (savedValue != null) {
      Controller.text = savedValue;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: TextField(
          controller: Controller,
          onChanged: (val) {
            saveText(val);
          },
        ),
      )),
    );
  }
}
