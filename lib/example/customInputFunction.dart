import 'package:td_driven_ui/custom_inputs/index.dart';
import 'package:td_driven_ui/custom_inputs/number/dial.dart';
import 'package:td_driven_ui/custom_inputs/number/stepper.dart';
import 'package:td_driven_ui/models/thingui/index.dart';

CustomInputFunction exampleCustomInputFunction =
    (ThingUiResource resource, ThingUiInput input) {
  if (input.contextualType == "LevelProperty") {
    return TdUiDialNumberInput();
  }
  if (input.contextualType == "LimitTime") {
    return TdUiStepperNumberInput();
  }
  return null;
};
