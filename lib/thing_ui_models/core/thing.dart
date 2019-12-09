import 'package:td_driven_ui/thing_ui_models/core/resource.dart';


class Thing {
  String name;
  String description;
  String icon;
  Uri baseUrl;

  Map<String, Resource> properties;
  Map<String, Resource> actions;
  Map<String, Resource> events;

}
