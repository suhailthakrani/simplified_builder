// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SimplifiedFutureBuilder<T> extends StatefulWidget {
  final Future<T> future;
  final Widget Function(T data) builder;
  final Widget Function(dynamic error) errorBuilder;
  final Widget loadingWidget;

  const SimplifiedFutureBuilder({
    Key? key,
    required this.future,
    required this.builder,
    required this.errorBuilder,
    this.loadingWidget = const CircularProgressIndicator(),
  }) : super(key: key);

  @override
  State<SimplifiedFutureBuilder> createState() =>
      _SimplifiedFutureBuilderState();
}

class _SimplifiedFutureBuilderState<T>
    extends State<SimplifiedFutureBuilder<T>> {
  late final Future<T> _future;
  late final Widget Function(T data) _builder;
  late final Widget Function(dynamic error) _errorBuilder;
  late final Widget _loadingWidget;

  @override
  void initState() {
    _future = widget.future;
    _builder = widget.builder;
    _errorBuilder = widget.errorBuilder;
    _loadingWidget = widget.loadingWidget;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: _future,
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
