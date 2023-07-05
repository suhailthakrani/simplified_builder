import 'package:flutter/material.dart';

import '../src/simplified_action_menu_builder.dart';

class SimplifiedActionMenuBuilderExample extends StatelessWidget {
  const SimplifiedActionMenuBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Action Menu Example'),
      ),
      body: Center(
        child: SimplifiedActionMenuBuilder(
          items: [
            MenuItem(
              title: 'Option 1',
              icon: Icons.favorite,
              onPressed: () {
                // Perform action for Option 1
              },
            ),
            MenuItem(
              title: 'Option 2',
              icon: Icons.settings,
              onPressed: () {
                // Perform action for Option 2
              },
            ),
            MenuItem(
              title: 'Option 3',
              icon: Icons.info,
              onPressed: () {
                // Perform action for Option 3
              },
            ),
          ],
          onItemSelected: (selectedItem) {
            selectedItem.onPressed();
          },
        ),
      ),
    );
  }
}
