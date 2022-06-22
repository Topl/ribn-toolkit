import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:ribn_toolkit/widgetbook.dart';

void main() {
  runApp(
    Portal(
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => WidgetBook(),
        },
      ),
    ),
  );
}
