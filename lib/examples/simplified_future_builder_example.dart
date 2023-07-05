import 'package:flutter/material.dart';

import '../src/simplified_builder.dart';

class SimplifiedFutureBuilderExample extends StatelessWidget {
  final Future<String> fetchData = Future.delayed(
    const Duration(seconds: 2),
    () => 'Data loaded successfully!',
  );

  SimplifiedFutureBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Builder Example'),
      ),
      body: Center(
        child: SimplifiedFutureBuilder<String>(
          future: fetchData,
          builder: (data) => Text(data),
          errorBuilder: (error) => Text('Error: $error'),
          loadingWidget: const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
