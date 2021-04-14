import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'navigation/navigation.dart';
import 'navigation/routes.dart';

void main() {
  final initialRoute = Routes.initialRoute;
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(initialRoute: initialRoute, getPages: Nav.routes);
  }
}
