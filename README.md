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

The SimplifiedBuilder classes provide a simple and concise way to handle asynchronous operations in Flutter applications, reducing the amount of boilerplate code required to handle these operations and improving the readability and maintainability of the codebase, and to asynchronously retrieve data and build the UI components based on the result of the asynchronous operation.

## Features

- Simplified and concise code: SimplifiedBuilder reduces the amount of boilerplate code needed to handle asynchronous operations, making code more readable, maintainable and easier to understand.

- Easy to use: SimplifiedBuilder provides a simple and easy-to-use API, which requires only three parameters, making it accessible to developers of all skill levels.

- Support for Futures and Streams: SimplifiedBuilder supports both Futures and Streams, making it a flexible solution for handling different types of asynchronous operations in Flutter applications.

- Error handling: SimplifiedBuilder provides an error builder function that can be used to handle errors that occur during the asynchronous operation.

- Flutter integration: SimplifiedBuilder uses the FutureBuilder and StreamBuilder widgets from the Flutter framework, which ensures that the UI is updated correctly when data is retrieved or when errors occur.

Here is an example 1:
```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimplifiedFutureBuilder(
    /// You can add any Future Here.
      future: getData(),
      builder: (response) {
        //Write your code here
        return Text(response.body);
      },
      errorBuilder: (error) {
        return Text('An error occurred: $error');
      },
    );
  }
}

```


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
      // You can add any Future here 
      future: http.get(Uri.parse('URI')),
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

This project is licensed under the MIT License - see the <a href="https://github.com/suhailthakrani/simplified_builder/blob/master/LICENSE" target="_blank"> LICENSE </a> file for details.
