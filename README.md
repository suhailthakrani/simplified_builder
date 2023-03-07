<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

SimplifiedFutureBuilder is a Flutter widget that simplifies the process of building widgets that depend on the results of a Future. It provides a more streamlined and readable way to handle the different states of a Future (loading, success, and error).

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

Add the following dependency to your pubspec.yaml:

dependencies:
  simplified_future_builder: ^1.0.0

## Usage

The SimplifiedFutureBuilder widget takes three required parameters:

- future: A Future that resolves to the data that the widget will depend on.
- builder: A function that takes the data returned by the future and returns a Widget to display.
- errorBuilder: A function that takes an error and returns a Widget to display if the future fails.
- loadingWidget: By default it provides CircularProgressIndicator(), but if user wants then he can other widget.

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimplifiedFutureBuilder(
      future: http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1')),
      builder: (data) {
        return Text(data.body);
      },
      errorBuilder: (error) {
        return Text('An error occurred: $error');
      },
    );
  }
}

```

## License

This project is licensed under the MIT License - see the LICENSE file for details.
