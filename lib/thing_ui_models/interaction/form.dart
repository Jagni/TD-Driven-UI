import 'dart:collection';

import 'package:td_driven_ui/thing_ui_models/actuation/actuator.dart';
import 'package:td_driven_ui/thing_ui_models/interaction/inputs/index.dart';

class TdUiForm {
  var readOnly = false;
  var showsSubmitButton = false;

  ///Map that contains all inputs that this form must show.
  ///Key: Input's unique ID
  ///Value: The Input object
  Map<String, TdUiInput> inputs = LinkedHashMap<String, TdUiInput>();

  TdUiActuation actuation = TdUiActuation();
}
