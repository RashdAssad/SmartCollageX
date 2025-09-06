import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:space_cosmos_clock/main.dart';

void main() {
  testWidgets('Clock screen builds and has a clock', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our clock screen is present.
    expect(find.byType(CustomPaint), findsOneWidget);
  });

  testWidgets('Tapping the screen shows the digital clock', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Initially, the digital clock is not visible.
    expect(find.byType(Text), findsNothing);

    // Tap the gesture detector to show the digital clock.
    await tester.tap(find.byType(GestureDetector));
    await tester.pump();

    // Verify that the digital clock is now visible.
    expect(find.byType(Text), findsOneWidget);
  });

  testWidgets('Long pressing the screen changes the shape', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Get the initial shape.
    final dynamic painter1 = tester.widget<CustomPaint>(find.byType(CustomPaint)).painter;
    final shape1 = painter1.shape;

    // Long press the gesture detector to change the shape.
    await tester.longPress(find.byType(GestureDetector));
    await tester.pump();

    // Get the new shape.
    final dynamic painter2 = tester.widget<CustomPaint>(find.byType(CustomPaint)).painter;
    final shape2 = painter2.shape;

    // Verify that the shape has changed.
    expect(shape1, isNot(equals(shape2)));
  });
}
