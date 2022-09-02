import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../firebase/models/Car.dart';
import 'addCar.dart';
import '../utils/CustomWidgets.dart';

class ListCar extends StatefulWidget {
  const ListCar({Key? key}) : super(key: key);

  final Text title = const Text("Carros");

  @override
  _ListCarState createState() => _ListCarState();
}

class _ListCarState extends State<ListCar> {
  insertCar(Car Car) async {
    FirebaseFirestore.instance.collection('cars').add(Car.toJson());
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
                        MaterialPageRoute(builder: (context) => AddCar()))
                    .then((Car) => insertCar(Car));
              })
        ],
      ),
      body: buidList(context),
    );
  }

  Widget buidList(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('cars').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const LinearProgressIndicator();
        }

        if (snapshot.data == null) {
          return Container(child: const Text("Nenhum carro encontrado"));
        } else {
          return buldListView(context, snapshot.data!.docs);
        }
      },
    );
  }

  Widget buldListView(
      BuildContext context, List<QueryDocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 30.0),
      children: snapshot.map((data) => buildListItems(context, data)).toList(),
    );
  }

  Widget buildListItems(BuildContext context, QueryDocumentSnapshot data) {
    Car p = Car.fromSnapshot(data);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5)),
        child: ListTile(
          //leading: Text(p.id != null ? p.id.toString() : "-1"),
          title: Text(p.name),
          subtitle: Text(p.brand),
          onLongPress: () {
            data.reference.delete();
          },
        ),
      ),
    );
  }
}
