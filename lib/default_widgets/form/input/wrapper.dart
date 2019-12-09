import 'package:flutter/material.dart';
import 'package:td_driven_ui/default_widgets/form/input/specifier.dart';

class TdUiInputWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(16.0),
            child: TdUiWidgetSpecifier(),
    );
  }
}
