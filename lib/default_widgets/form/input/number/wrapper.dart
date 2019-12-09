import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/default_widgets/form/input/number/specifier.dart';
import 'package:td_driven_ui/thing_ui_models/thing_ui_models.dart';


class TdUiNumberInputWrapper extends StatelessWidget {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListenableProvider<TextEditingController>.value(
        child: TdUiNumberInputSpecifier(),
        value: controller,
      );
  }
}