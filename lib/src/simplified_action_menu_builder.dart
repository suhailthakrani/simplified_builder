import 'package:flutter/material.dart';

class SimplifiedActionMenuBuilder extends StatelessWidget {
  final List<MenuItem> items;
  final void Function(MenuItem selectedItem) onItemSelected;

  const SimplifiedActionMenuBuilder({
    Key? key,
    required this.items,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuItem>(
      itemBuilder: (context) => items
          .map(
            (item) => PopupMenuItem<MenuItem>(
              value: item,
              child: Text(item.title),
            ),
          )
          .toList(),
      onSelected: onItemSelected,
    );
  }
}

class MenuItem {
  final String title;
  final IconData icon;
  final void Function() onPressed;

  const MenuItem({
    required this.title,
    required this.icon,
    required this.onPressed,
  });
}
