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
