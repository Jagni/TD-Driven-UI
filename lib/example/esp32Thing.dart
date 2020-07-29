import 'package:td_driven_ui/models/thingui/actuation/index.dart';
import 'package:td_driven_ui/models/thingui/index.dart';

ThingUiThing esp32Thing() {
  final thing = ThingUiThing();
  thing.baseUrl = Uri.parse("http://192.168.0.36/things/led");

  final levelProperty = ThingUiResource();
  levelProperty.name = "Level";
  levelProperty.description = "The level of light from 0-100 %";

  final levelInput = ThingUiFieldInput();
  levelInput.label = "Level";
  levelInput.min = 0;
  levelInput.max = 100;
  levelInput.unit = "%";
  levelInput.type = "number";
  levelInput.contextualType = "LevelProperty";

  levelProperty.inputs["level"] = levelInput;

  final levelActuation = ThingUiActuation();
  levelActuation.communicationProtocol = CommunicationProtocol.http;
  levelActuation.securityScheme = SecurityScheme.none;
  levelActuation.href =
      Uri.parse("http://192.168.0.36/things/led/properties/level");

  levelProperty.actuation = levelActuation;

  thing.properties["level"] = levelProperty;

  final limitTimeProperty = ThingUiResource();
  limitTimeProperty.name = "Limit time";
  limitTimeProperty.description = "How much time the lamp can stay turned on";

  final limitTimeInput = ThingUiFieldInput();
  limitTimeInput.label = "Limit time";
  limitTimeInput.min = 0;
  limitTimeInput.max = 100;
  limitTimeInput.unit = "min";
  limitTimeInput.type = "number";
  limitTimeInput.contextualType = "LimitTime";
  limitTimeProperty.inputs["limitTime"] = limitTimeInput;

  final limitTimeActuation = ThingUiActuation();
  limitTimeActuation.communicationProtocol = CommunicationProtocol.http;
  limitTimeActuation.securityScheme = SecurityScheme.none;
  limitTimeActuation.href =
      Uri.parse("http://192.168.0.36/things/led/properties/limitTime");

  limitTimeProperty.actuation = limitTimeActuation;

  thing.properties["limitTime"] = limitTimeProperty;
  return thing;
}
