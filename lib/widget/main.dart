import 'package:akhir/firebase_option.dart';
import 'package:akhir/home/card.dart';
import 'package:akhir/screen/call.dart';
import 'package:akhir/widget/theme.dart';
import 'package:flutter/material.dart';

import '../firebase_option.dart';
import '../screen/login.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApk());
}

class MyApk extends StatelessWidget {
  const MyApk({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light),
      debugShowCheckedModeBanner: false,
      home: HomeApk(),
    );
  }
}

class HomeApk extends StatefulWidget {
  const HomeApk({super.key});

  @override
  State<HomeApk> createState() => _HomeApkState();
}

class _HomeApkState extends State<HomeApk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
        backgroundColor: softpurpleColor,
        centerTitle: true,
        title: Text("S-LET", textAlign: TextAlign.center),
      ),
      body: LoginPage(),
    );
  }
}
