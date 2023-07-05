import 'package:flutter/material.dart';

class SimplifiedFormBuilder extends StatefulWidget {
  final Widget Function(BuildContext context, GlobalKey<FormState> formKey, Map<String, dynamic> formData) builder;
  final void Function(Map<String, dynamic> formData) onSubmit;
  final void Function(Map<String, dynamic> formData)? onFormReset;
  final bool autovalidate;
  final InputDecoration? inputDecoration;
  final bool validateOnChange;

  const SimplifiedFormBuilder({
    Key? key,
    required this.builder,
    required this.onSubmit,
    this.onFormReset,
    this.autovalidate = false,
    this.inputDecoration,
    this.validateOnChange = true,
  }) : super(key: key);

  @override
  State<SimplifiedFormBuilder> createState() => _SimplifiedFormBuilderState();
}

class _SimplifiedFormBuilderState extends State<SimplifiedFormBuilder> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: widget.autovalidate ? AutovalidateMode.always : AutovalidateMode.disabled,
      child: widget.builder(context, _formKey, _formData),
    );
  }

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.onSubmit(_formData);
    }
  }

  void resetForm() {
    _formKey.currentState!.reset();
    _formData.clear();

    if (widget.onFormReset != null) {
      widget.onFormReset!(_formData);
    }
  }
}
