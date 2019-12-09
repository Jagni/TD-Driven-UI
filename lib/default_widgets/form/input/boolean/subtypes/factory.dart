import 'package:td_driven_ui/thing_ui_models/interaction/inputs/boolean/index.dart';
import 'package:td_driven_ui/thing_ui_models/interaction/inputs/boolean/types.dart';

class BooleanInputWidgetFactory {
  static build(TdUiBooleanInput input){
    switch(input.subType){
      case BooleanInputType.lever:
        break;
      case BooleanInputType.checkbox:
        // TODO: Handle this case.
        break;
      case BooleanInputType.button:
        // TODO: Handle this case.
        break;
    }
  }
}