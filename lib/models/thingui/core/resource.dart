import 'package:td_driven_ui/models/thingui/actuation/actuation.dart';
import 'package:td_driven_ui/models/thingui/index.dart';

class ThingUiResource {
  String name;
  String description;

  ///Map that contains all inputs that this form must show.
  ///Key: Input's unique ID
  ///Value: The Input object
  Map<String, ThingUiInput> inputs = Map<String, ThingUiInput>();
  ThingUiActuation actuation = ThingUiActuation();
  String type;
  String contextualType;

  get showsSubmitButton {
    return type != "property";
  }
}
