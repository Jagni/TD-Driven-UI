import 'package:td_driven_ui/thing_ui_models/interaction/inputs/types.dart';

abstract class Input {
  ///Unique ID
  String id;

  ///Label of this input that should be shown to the user.
  String label;

  ///The value that is being modified by the user.
  dynamic editingValue;
  ///The most recent entry the Thing emmitted that is associated with this input.
  final dynamic thingValue;

  bool interactionEnabled = true;

  final InputType type;
  
  Input(this.type, this.thingValue);
}
