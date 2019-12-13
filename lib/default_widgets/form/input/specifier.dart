import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/default_widgets/form/input/number/wrapper.dart';
import 'package:td_driven_ui/default_widgets/form/input/text/wrapper.dart';
import 'package:td_driven_ui/thing_ui_models/thing_ui_models.dart';

class TdUiWidgetSpecifier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildInput(context);
  }

  buildInput(BuildContext context) {
    final input = Provider.of<TdUiInput>(context);
    switch (input.type) {
      case InputType.text:
        if (input is TdUiTextInput) {
          return Provider<TdUiTextInput>.value(
              value: input, child: TdUiTextInputWrapper());
        }
        break;
      case InputType.number:
        return Provider<TdUiNumberInput>.value(
            value: input, child: TdUiNumberInputWrapper());
        break;
      case InputType.object:
        // TODO: Handle this case.
        break;
      case InputType.boolean:
        if (input is TdUiBooleanInput) {
          return Provider<TdUiBooleanInput>.value(
              value: input, child: TdUiNumberInputWrapper());
        }
    }

    return null;
  }
}
