import 'package:flute/pages/loading.dart';
import 'package:flute/pages/create_page.dart';
import 'package:flute/pages/task_page.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Loading(),
      routes: {
        "/home":(context) => Homestuff(),
        "/create":(context) => const Create(),
        "/tasks":(context) => const Task(),
      },
    );

  }
}

