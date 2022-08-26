import 'package:flutter/material.dart';
import '../customs/itemList.dart';
import '../models/DatabaseWidget.dart';
import '../utils/CustomWidgets.dart';

class ListPerson extends StatelessWidget {
  ListPerson({Key? key}) : super(key: key);
  Text title = const Text('Flutter - Persistência');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: title,
        ),
        body: ListView(
          children: <Widget>[],
        ));
  }
}
