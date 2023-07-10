import 'package:flutter/material.dart';

/// A widget that builds a simplified action menu using a [PopupMenuButton].
///
/// The [SimplifiedActionMenuBuilder] takes a list of [MenuItem]s and a callback function [onItemSelected]
/// that is called when an item is selected from the menu.
class SimplifiedActionMenuBuilder extends StatelessWidget {
  /// The list of menu items to be displayed in the action menu.
  final List<MenuItem> items;

  /// The callback function that is called when an item is selected from the menu.
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

/// Represents a menu item in the action menu.
class MenuItem {
  /// The title of the menu item.
  final String title;

  /// The icon to be displayed next to the menu item.
  final IconData icon;

  /// The callback function that is called when the menu item is pressed.
  final void Function() onPressed;

  const MenuItem({
    required this.title,
    required this.icon,
    required this.onPressed,
  });
}
