import 'package:flutter/material.dart';
import 'package:flutter_all_persistence_types/models/DatabaseWidget.dart';
import 'package:flutter_all_persistence_types/nosql/listBook.dart';

import 'screens/home.dart';
import 'sqllite/listPerson.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/person': (context) => ListPerson(),
        '/book': (context) => ListBook(),
      },
    );
  }
}
