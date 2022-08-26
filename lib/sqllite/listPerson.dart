import 'package:flutter/material.dart';
import 'package:flutter_all_persistence_types/sqllite/addPerson.dart';
import 'package:flutter_all_persistence_types/sqllite/models/Person.dart';
import '../utils/CustomWidgets.dart';
import 'daos/PersonDao.dart';

class ListPerson extends StatefulWidget {
  const ListPerson({Key? key}) : super(key: key);

  final Text title = const Text("Pessoas");

  @override
  _ListPersonState createState() => _ListPersonState();
}

class _ListPersonState extends State<ListPerson> {
  List<Person> persons = <Person>[];

  @override
  void initState() {
    super.initState();
    getAllPersons();
  }

  getAllPersons() async {
    List<Person> result = await PersonDao().readAll();
    setState(() {
      persons = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.title,
        actions: [
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddPerson()))
                    .then((person) => {
                          setState(() {
                            persons.add(person);
                          })
                        });
              })
        ],
      ),
      body: ListView(children: buildListItems()),
    );
  }

  List<Widget> buildListItems() {
    return persons
        .map((p) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5)),
                child: ListTile(
                  leading: Text(p.id != null ? p.id.toString() : "-1"),
                  title: Text(p.firstName),
                  subtitle: Text(p.lastName),
                ),
              ),
            ))
        .toList();
  }
}
