import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/default_widgets/form/input/number/subtypes/dial.dart';
import 'package:td_driven_ui/default_widgets/form/input/number/subtypes/stepper.dart';
import 'package:td_driven_ui/thing_ui_models/thing_ui_models.dart';

class TdUiNumberInputSpecifier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildInput(context);
  }

  static Widget buildInput(BuildContext context) {
    final input = Provider.of<TdUiNumberInput>(context);
    //Default values
    var inputType = TextInputType.text;
    Widget child = TdUiStepperNumberInput();

    switch (input.subType) {
      case NumberInputType.dial:
        // TODO: Handle this case.
        child = TdUiDialNumberInput();
        break;
      case NumberInputType.slider:
        // TODO: Handle this case.
        break;
      case NumberInputType.keyboard:
        // TODO: Handle this case.
        break;
      case NumberInputType.stepper:
        child = TdUiStepperNumberInput();
        break;
    }
    return MultiProvider(providers: [
      Provider<TextInputType>.value(value: inputType),
      Provider.value(value: 0)
    ], child: child);
  }
}
