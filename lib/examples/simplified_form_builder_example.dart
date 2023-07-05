import 'dart:developer';

import 'package:flutter/material.dart';

import '../src/simplified_builder.dart';

class SimplifiedFormBuilderExample extends StatelessWidget {
  const SimplifiedFormBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Builder Example'),
      ),
      body: Center(
        child: SimplifiedFormBuilder(
          builder: (context, formKey, formData) {
            return Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    formData['name'] = value;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    formKey.currentState!.reset();
                  },
                  child: const Text('Reset'),
                ),
                ElevatedButton(
                  onPressed: () {
                    formKey.currentState!.save();
                    if (formKey.currentState!.validate()) {
                      log('Form submitted');
                      log(formData.toString());
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            );
          },
          onSubmit: (formData) {
            log('Form submitted');
            log(formData.toString());
          },
          onFormReset: (formData) {
            log('Form reset');
            log(formData.toString());
          },
          autovalidate: true,
          inputDecoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          validateOnChange: true,
        ),
      ),
    );
  }
}
