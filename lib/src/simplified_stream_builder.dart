import 'package:flutter/material.dart';

/// A widget that simplifies asynchronous stream handling using a [StreamBuilder].
///
/// The [SimplifiedStreamBuilder] takes a [stream] that represents the asynchronous stream,
/// a [builder] function that is called when the stream emits data,
/// an [errorBuilder] function that is called when the stream emits an error,
/// and an optional [loadingWidget] to display while waiting for the stream data.
class SimplifiedStreamBuilder<T> extends StatefulWidget {
  /// The stream representing the asynchronous data flow.
  final Stream<T> stream;

  /// The builder function that is called when the stream emits data.
  final Widget Function(T data) builder;

  /// The builder function that is called when the stream emits an error.
  final Widget Function(dynamic error) errorBuilder;

  /// The widget to display while waiting for the stream data.
  final Widget loadingWidget;

  const SimplifiedStreamBuilder({
    Key? key,
    required this.stream,
    required this.builder,
    required this.errorBuilder,
    this.loadingWidget = const CircularProgressIndicator(),
  }) : super(key: key);

  @override
  State<SimplifiedStreamBuilder<T>> createState() =>
      _SimplifiedStreamBuilderState<T>();
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
