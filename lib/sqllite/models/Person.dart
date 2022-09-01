class Person {
  int? id;
  final String firstName;
  final String lastName;
  final String address;

  Person(
    this.id,
    this.firstName,
    this.lastName,
    this.address,
  );
/*
  Construtor nominal, onde eu tenho que descrever todos os parâmetros.
  Exemplo: Person(id: 1, firstName: "João", lastName: "Silva", address: "Rua 1, 123");
  Person({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.address,
  });
*/

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'address': address,
    };
  }
}
