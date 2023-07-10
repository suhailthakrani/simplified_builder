import 'package:flutter/material.dart';

/// A widget that builds a simplified data grid using a ListView.
///
/// The [SimplifiedDataGridBuilder] takes a [data] list containing the data to display in the grid,
/// and a [columns] list defining the columns of the grid.
class SimplifiedDataGridBuilder<T> extends StatelessWidget {
  /// The data to display in the grid.
  final List<T> data;

  /// The columns of the data grid.
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

/// Represents a column in a data grid.
class DataGridColumn<T> {
  /// The title of the column.
  final String title;

  /// The function that retrieves the value for the column for a given item.
  final String Function(T item) getValue;

  /// The flex factor of the column, determining its relative width in the grid.
  final int? flex;

  const DataGridColumn({
    required this.title,
    required this.getValue,
    this.flex,
  });
}
