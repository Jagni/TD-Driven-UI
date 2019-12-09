import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/default_widgets/form/input/boolean/subtypes/checkbox.dart';
import 'package:td_driven_ui/thing_ui_models/thing_ui_models.dart';

class TdUiBooleanInputSpecifier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildInput(context);
  }

  static Widget buildInput(BuildContext context) {
    final input = Provider.of<TdUiBooleanInput>(context);
    Widget child = TdUiCheckboxBooleanInput();

    switch (input.subType) {
      case BooleanInputType.lever:
        // TODO: Handle this case.
        break;
      case BooleanInputType.checkbox:
        // TODO: Handle this case.
        break;
      case BooleanInputType.button:
        // TODO: Handle this case.
        break;
    }
    return Provider.value(value: false, child: child);
  }
}
