import 'package:td_driven_ui/thing_ui_models/thing_ui_models.dart';

class Resource {
  String name;
  String description;
  String icon;
  TdUiForm form;
}

class Property extends Resource {
  bool isReadOnly;
}

class Action extends Resource {
}

class Event extends Resource {
}
