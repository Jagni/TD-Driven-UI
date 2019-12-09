import 'package:td_driven_ui/thing_ui_models/interaction/form.dart';
import 'package:td_driven_ui/thing_ui_models/interaction/inputs/index.dart';
import 'package:td_driven_ui/thing_ui_models/interaction/inputs/types.dart';

class ObjectInput extends TdUiInput {
  final TdUiForm form;
  ObjectInput(this.form) : super(InputType.object);
}
