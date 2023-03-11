// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SimplifiedStreamBuilder<T> extends StatefulWidget {
  final Stream<T> stream;
  final Widget Function(T data) builder;
  final Widget Function(dynamic error) errorBuilder;
  final Widget loadingWidget;

  const SimplifiedStreamBuilder({
    Key? key,
    required this.stream,
    required this.builder,
    required this.errorBuilder,
    this.loadingWidget = const CircularProgressIndicator(),
  }) : super(key: key);

  @override
  State<SimplifiedStreamBuilder> createState() =>
      _SimplifiedStreamBuilderState();
}

class _SimplifiedStreamBuilderState<T>
    extends State<SimplifiedStreamBuilder<T>> {
  late final Stream<T> _stream;
  late final Widget Function(T data) _builder;
  late final Widget Function(dynamic error) _errorBuilder;
  late final Widget _loadingWidget;
  @override
  void initState() {
    _stream = widget.stream;
    _builder = widget.builder;
    _errorBuilder = widget.errorBuilder;
    _loadingWidget = widget.loadingWidget;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: _stream,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        if (snapshot.hasData) {
          return _builder(snapshot.data as T);
        }
        if (snapshot.hasError) {
          return _errorBuilder(snapshot.error);
        } else {
          return Center(
            child: _loadingWidget,
          );
        }
      },
    );
  }
}
