import 'package:td_driven_ui/thing_ui_models/core/resource.dart';


class Thing {
  String name;
  String description;
  String icon;
  Uri baseUrl;

  Map<String, Property> properties = Map<String, Property>();
  Map<String, Action> actions = Map<String, Action>();
  Map<String, Event> events = Map<String, Event>();

}
