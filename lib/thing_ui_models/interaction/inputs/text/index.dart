import 'package:td_driven_ui/thing_ui_models/interaction/inputs/index.dart';
import 'package:td_driven_ui/thing_ui_models/interaction/inputs/text/types.dart';
import 'package:td_driven_ui/thing_ui_models/interaction/inputs/types.dart';

class TdUiTextInput extends TdUiInput {
  final TdUiTextInputType subType;
  TdUiTextInput(this.subType) : super(InputType.text);
}