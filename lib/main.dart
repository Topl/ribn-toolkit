// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_portal/flutter_portal.dart';

// Project imports:
import 'package:ribn_toolkit/widgetbook.dart';

void main() {
  runApp(
    Portal(
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const WidgetBook(),
        },
      ),
    ),
  );
}
