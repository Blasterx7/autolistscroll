<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# AutoScrollList

AutoScrollList is a Flutter package that provides a list that automatically scrolls to the bottom.

## Features

- Automatically scrolls to the bottom

## Getting started

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  auto_scroll_list: ^0.0.1
```

In your library add the following import:

```dart
import 'package:autolistscroll/autolistscroll.dart';
```

## Usage

To use this package, just add the `AutoScrollView` widget to your widget tree.

```dart
AutoScrollView(
      autoScrollController: _autoScrollController,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: 50,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
          );
        },
      ),
    );
```

## Example

```dart
import 'package:autolistscroll/autolistscroll.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Auto Scroll View')),
        body: AutoScrollDemo(),
      ),
    );
  }
}

class AutoScrollDemo extends StatefulWidget {
  const AutoScrollDemo({super.key});

  @override
  _AutoScrollDemoState createState() => _AutoScrollDemoState();
}

class _AutoScrollDemoState extends State<AutoScrollDemo> {
  late ScrollController _scrollController;
  late AutoScrollController _autoScrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _autoScrollController = AutoScrollController(controller: _scrollController, interval: const Duration(milliseconds: 50), scrollOffset: 3.0);
    _autoScrollController.start();
  }

  @override
  void dispose() {
    _autoScrollController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AutoScrollView(
      autoScrollController: _autoScrollController,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: 50,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
          );
        },
      ),
    );
  }
}
```

## Additional information

For help on editing package code, view the [documentation](https://dart.dev/tools/pub/writing-package-pages).
