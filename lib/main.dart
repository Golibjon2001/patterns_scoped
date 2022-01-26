import 'package:flutter/material.dart';
import 'package:patterns_scoped/pages/create_page.dart';
import 'package:patterns_scoped/pages/hom_page.dart';
import 'package:patterns_scoped/pages/update_page.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:HomePage(),
      routes:{
        HomePage.id:(context)=>HomePage(),
        AddPage.id:(context)=>const AddPage(),
        UpdatePage.id:(context)=>UpdatePage(),
      },
    );
  }
}

