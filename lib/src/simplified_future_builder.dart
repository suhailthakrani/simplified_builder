// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

/// A widget that simplifies asynchronous future handling using a [FutureBuilder].
///
/// The [SimplifiedFutureBuilder] takes a [future] that represents the asynchronous operation,
/// a [builder] function that is called when the future completes with data,
/// an [errorBuilder] function that is called when the future completes with an error,
/// and an optional [loadingWidget] to display while the future is loading.
class SimplifiedFutureBuilder<T> extends StatefulWidget {
  /// The future representing the asynchronous operation.
  final Future<T> future;

  /// The builder function that is called when the future completes with data.
  final Widget Function(T data) builder;

  /// The builder function that is called when the future completes with an error.
  final Widget Function(dynamic error) errorBuilder;

  /// The widget to display while the future is loading.
  final Widget loadingWidget;

  const SimplifiedFutureBuilder({
    Key? key,
    required this.future,
    required this.builder,
    required this.errorBuilder,
    this.loadingWidget = const CircularProgressIndicator(),
  }) : super(key: key);

  @override
  State<SimplifiedFutureBuilder<T>> createState() =>
      _SimplifiedFutureBuilderState<T>();
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
