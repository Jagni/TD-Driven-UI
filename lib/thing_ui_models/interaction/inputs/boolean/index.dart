import 'package:td_driven_ui/thing_ui_models/interaction/inputs/boolean/types.dart';
import 'package:td_driven_ui/thing_ui_models/interaction/inputs/index.dart';
import 'package:td_driven_ui/thing_ui_models/interaction/inputs/types.dart';

class TdUiBooleanInput extends TdUiInput{
  final BooleanInputType subType;
  TdUiBooleanInput(this.subType) : super(InputType.boolean);
}