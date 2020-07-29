import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/main/dashboard.dart';
import 'package:td_driven_ui/utils/color.dart';

import 'example/customInputFunction.dart';
import 'example/esp32Thing.dart';

void main() {
  runApp(MultiProvider(providers: [
    Provider.value(value: exampleCustomInputFunction),
    Provider.value(value: esp32Thing())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final primaryColor = HexColor("#1E4153");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          cardTheme: CardTheme(shadowColor: Colors.black, color: primaryColor),
          primaryColor: primaryColor,
          accentColor: primaryColor,
          scaffoldBackgroundColor: Colors.white),
      home: Scaffold(
          appBar: AppBar(
            title: Text("smar2t"),
          ),
          body: Dashboard()),
    );
  }
}
