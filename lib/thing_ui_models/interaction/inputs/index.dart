import 'package:td_driven_ui/thing_ui_models/interaction/inputs/types.dart';

abstract class TdUiInput {
  ///Unique ID
  String id;

  String description = "";

  ///Label of this input that should be shown to the user.
  String label;

  bool interactionEnabled = true;

  final InputType type;

  TdUiInput(this.type);
}
