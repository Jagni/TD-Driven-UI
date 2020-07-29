import 'package:td_driven_ui/models/thingui/core/resource.dart';

class ThingUiThing {
  String name;
  String description;
  String icon;
  Uri baseUrl;

  Map<String, ThingUiResource> properties = Map<String, ThingUiResource>();
  Map<String, ThingUiResource> actions = Map<String, ThingUiResource>();
  Map<String, ThingUiResource> events = Map<String, ThingUiResource>();
}
