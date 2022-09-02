import 'package:flutter/material.dart';
import '../firebase/models/Car.dart';

class AddCar extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameCarController = TextEditingController();
  final TextEditingController _brandCarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo carro"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Nome", labelText: "Nome"),
                  controller: _nameCarController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Insira o nome do carro';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Marca", labelText: "Marca"),
                  controller: _brandCarController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Insira a marca do carro';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Car car = Car(
                            _nameCarController.text, _brandCarController.text);
                        Navigator.pop(context, car);
                      }
                    },
                    child: Text('Salvar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
