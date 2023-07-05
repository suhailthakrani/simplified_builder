import 'package:flutter/material.dart';

import '../src/simplified_builder.dart';

class SimplifiedDataGridBuilderExample extends StatelessWidget {
  final List<User> users = [
    User(name: 'John Doe', age: 30),
    User(name: 'Jane Smith', age: 25),
    User(name: 'Bob Johnson', age: 40),
  ];

  final List<DataGridColumn<User>> columns = [
    DataGridColumn<User>(
      title: 'Name',
      getValue: (user) => user.name,
    ),
    DataGridColumn<User>(
      title: 'Age',
      getValue: (user) => user.age.toString(),
      flex: 1,
    ),
  ];

  SimplifiedDataGridBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Grid Builder Example'),
      ),
      body: Center(
        child: SimplifiedDataGridBuilder<User>(
          data: users,
          columns: columns,
        ),
      ),
    );
  }
}

class User {
  final String name;
  final int age;

  User({
    required this.name,
    required this.age,
  });
}
