import 'package:autolistscroll/autolistscroll.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AutoScrollController starts and stops', () {
    final controller = ScrollController();
    final autoScrollController = AutoScrollController(controller: controller);

    autoScrollController.start();
    expect(autoScrollController, isNotNull);

    autoScrollController.stop();
    expect(() => autoScrollController.stop(), returnsNormally);
  });
}
