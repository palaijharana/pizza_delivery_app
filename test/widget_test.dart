import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pizza_delivery_app/main.dart';

void main() {
  testWidgets('Pizza app loads correctly', (WidgetTester tester) async {
    
    // Load app
    await tester.pumpWidget(const PizzaApp());

    // Let UI settle
    await tester.pumpAndSettle();

    // Check App title
    expect(find.text('🍕 Pizza Hub'), findsOneWidget);

    // Check pizzas
    expect(find.text('Pepperoni Feast'), findsOneWidget);
    expect(find.text('Veggie Supreme'), findsOneWidget);
  });
}