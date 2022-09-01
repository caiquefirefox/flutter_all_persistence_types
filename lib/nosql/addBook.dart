import 'package:flutter/material.dart';
import 'models/Book.dart';

class AddBook extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameBookController = TextEditingController();
  final TextEditingController _authorBookController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo livro"),
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
                  controller: _nameBookController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Insira o nome do livro';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Autor", labelText: "Autor"),
                  controller: _authorBookController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Insira o nome do autor do livro';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Book person = Book(
                            id: null,
                            name: _nameBookController.text,
                            author: _authorBookController.text);
                        Navigator.pop(context, person);
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
