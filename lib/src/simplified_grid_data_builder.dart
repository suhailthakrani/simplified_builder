import 'package:flutter/material.dart';

class SimplifiedDataGridBuilder<T> extends StatelessWidget {
  final List<T> data;
  final List<DataGridColumn<T>> columns;

  const SimplifiedDataGridBuilder({
    Key? key,
    required this.data,
    required this.columns,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            for (var column in columns)
              Expanded(
                flex: column.flex ?? 1,
                child: Text(column.title),
              ),
          ],
        ),
        for (var item in data)
          Row(
            children: [
              for (var column in columns)
                Expanded(
                  flex: column.flex ?? 1,
                  child: Text(column.getValue(item)),
                ),
            ],
          ),
      ],
    );
  }
}

class DataGridColumn<T> {
  final String title;
  final String Function(T item) getValue;
  final int? flex;

  const DataGridColumn({
    required this.title,
    required this.getValue,
    this.flex,
  });
}
