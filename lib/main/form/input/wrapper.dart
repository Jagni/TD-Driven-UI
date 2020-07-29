import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/custom_inputs/index.dart';
import 'package:td_driven_ui/custom_inputs/number/stepper.dart';
import 'package:td_driven_ui/main/form/input/types/number.dart';
import 'package:td_driven_ui/main/form/input/types/text.dart';
import 'package:td_driven_ui/models/thingui/index.dart';
import 'package:td_driven_ui/utils/info_dialog.dart';

class InputWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: buildInput(context),
    );
  }

  buildInput(BuildContext context) {
    final input = Provider.of<ThingUiInput>(context, listen: false);
    final resource = Provider.of<ThingUiResource>(context, listen: false);
    final customInputFunction =
        Provider.of<CustomInputFunction>(context, listen: false);

    final customInput = customInputFunction(resource, input);
    if (customInput != null) {
      return customInput;
    }

    switch (input.type) {
      case "object":
        return Container();
        break;

      case "number":
        return ThingUiNumberInput();
        break;

      default:
        return ThingUiTextInput();
        break;
    }
  }
}
