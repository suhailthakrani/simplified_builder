import 'package:flutter/material.dart';

/// A widget that simplifies form handling by providing a form builder and managing form state.
///
/// The [SimplifiedFormBuilder] takes a [builder] function that is called to build the form UI,
/// a [onSubmit] callback function that is called when the form is submitted,
/// an optional [onFormReset] callback function that is called when the form is reset,
/// a [autovalidate] flag to control automatic validation,
/// an optional [inputDecoration] for customizing the form input decoration,
/// and a [validateOnChange] flag to control whether the form should be validated on field value changes.
class SimplifiedFormBuilder extends StatefulWidget {
  /// The builder function that is called to build the form UI.
  final Widget Function(BuildContext context, GlobalKey<FormState> formKey, Map<String, dynamic> formData) builder;

  /// The callback function that is called when the form is submitted.
  final void Function(Map<String, dynamic> formData) onSubmit;

  /// The optional callback function that is called when the form is reset.
  final void Function(Map<String, dynamic> formData)? onFormReset;

  /// Flag to enable/disable auto validation of the form.
  final bool autovalidate;

  /// The optional input decoration for customizing the form fields.
  final InputDecoration? inputDecoration;

  /// Flag to control whether the form should be validated on field value changes.
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

  /// Submits the form if it is valid and calls the [onSubmit] callback.
  void submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.onSubmit(_formData);
    }
  }

  /// Resets the form by calling [reset] on the form key and clearing the form data.
  /// If [onFormReset] is provided, it is called with the cleared form data.
  void resetForm() {
    _formKey.currentState!.reset();
    _formData.clear();

    if (widget.onFormReset != null) {
      widget.onFormReset!(_formData);
    }
  }
}
