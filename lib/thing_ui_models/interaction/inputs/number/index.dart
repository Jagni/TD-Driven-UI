import 'package:td_driven_ui/thing_ui_models/interaction/inputs/index.dart';
import 'package:td_driven_ui/thing_ui_models/interaction/inputs/number/types.dart';
import 'package:td_driven_ui/thing_ui_models/interaction/inputs/types.dart';

class TdUiNumberInput extends TdUiInput {
  double min;
  double max;
  String unit = "";
  final NumberInputType subType;
  TdUiNumberInput(this.subType) : super(InputType.number);
}
