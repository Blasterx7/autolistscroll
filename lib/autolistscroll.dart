import 'dart:async';
import 'package:flutter/widgets.dart';

class AutoScrollController {
  final ScrollController _controller;
  final Duration interval;
  final double scrollOffset;

  AutoScrollController({
    required ScrollController controller,
    this.interval = const Duration(seconds: 3),
    this.scrollOffset = 2.0,
  }) : _controller = controller;

  Timer? _timer;

  void start() {
    _timer = Timer.periodic(interval, (timer) {
      if (_controller.hasClients) {
        final maxScroll = _controller.position.maxScrollExtent;
        final currentScroll = _controller.offset;

        if (currentScroll < maxScroll) {
          _controller.jumpTo(currentScroll + scrollOffset);
        } else {
          _controller.jumpTo(0);
        }
      }
    });
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  void dispose() {
    stop();
  }
}

class AutoScrollView extends StatelessWidget {
  final Widget child;
  final AutoScrollController autoScrollController;

  const AutoScrollView({
    super.key,
    required this.child,
    required this.autoScrollController,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollEndNotification>(
      onNotification: (notification) {
        autoScrollController.start();
        return true;
      },
      child: child,
    );
  }
}
