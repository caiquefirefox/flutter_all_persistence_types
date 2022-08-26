import 'package:flutter/material.dart';
import '../customs/itemList.dart';
import '../models/DatabaseWidget.dart';
import '../utils/CustomWidgets.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  Text title = const Text('Flutter - Persistência');
  List<DatabaseWidget> databases = [
    DatabaseWidget('SQL Lite', 'Lista de Pessoas'),
    DatabaseWidget('Floor', 'Lista de Livros'),
    DatabaseWidget('Firebase', 'Lista de carros'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: title,
        ),
        body: ListView(
          children: <Widget>[
            Expanded(
              child: SqliteWidget,
            ),
            divisorListMain()
          ],
        ));
  }

  Widget SqliteWidget = Card(
      child: ListTile(
    leading: buildSvgIcon('images/sqlite-icon.svg'),
    title: const Text('SQL Lite'),
    subtitle: const Text('Lista de Pessoas'),
    trailing: const Icon(Icons.navigate_next),
    //onTap: ,
  ));

  List<Widget> buildListItens() {
    return databases
        .map((database) =>
            getItemList(database.title, database.subtitle, database.icon))
        .toList();
  }
}
