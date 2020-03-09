import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:td_driven_ui/ar_sample.dart';
import 'package:td_driven_ui/example_td.dart';

void main() {
  runApp(Provider.value(value: ExampleTD.instance(), child: ARSample()));
}