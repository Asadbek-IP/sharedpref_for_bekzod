import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpref/pages/home_page.dart';
import 'package:sharedpref/pages/login_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {


  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLogin = false;

  getIsLogin()async{
     SharedPreferences shared = await SharedPreferences.getInstance();
    setState(() {
      isLogin = shared.getBool("isLogin")?? false;
    });

}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIsLogin();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: isLogin? HomePage():LoginPage());
  }
}
