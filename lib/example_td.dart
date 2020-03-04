import 'package:td_driven_ui/thing_ui_models/actuation/actuator.dart';
import 'package:td_driven_ui/thing_ui_models/actuation/communication_protocols.dart';
import 'package:td_driven_ui/thing_ui_models/actuation/security_schemes.dart';
import 'package:td_driven_ui/thing_ui_models/core/resource.dart';
import 'package:td_driven_ui/thing_ui_models/core/thing.dart';
import 'package:td_driven_ui/thing_ui_models/thing_ui_models.dart';

class ExampleTD {
  static Thing instance() {
    final thing = Thing();
  thing.baseUrl = Uri.parse("http://192.168.0.36/things/led");

  final levelProperty = Property();
  levelProperty.name = "level";
  final levelForm = TdUiForm();
  final dialInput = TdUiNumberInput(NumberInputType.dial);
  dialInput.label = "Level";
  dialInput.min = 0;
  dialInput.max = 100;
  dialInput.unit = "%";
  dialInput.description = "The level of light from 0-100 %";
  levelForm.inputs["level"] = dialInput;

  final levelActuation = TdUiActuation();
  levelActuation.communicationProtocol = CommunicationProtocol.http;
  levelActuation.securityScheme = SecurityScheme.none;
  levelActuation.href =
      Uri.parse("http://192.168.0.36/things/led/properties/level");

  levelForm.actuation = levelActuation;

  levelProperty.form = levelForm;
  thing.properties["level"] = levelProperty;

  final limitTimeProperty = Property();
  limitTimeProperty.name = "Limit time";
  final timeForm = TdUiForm();
  final stepperInput = TdUiNumberInput(NumberInputType.stepper);
  stepperInput.label = "Limit time";
  stepperInput.min = 0;
  stepperInput.max = 100;
  stepperInput.unit = "min";
  stepperInput.description = "How much time the lamp can stay turned on";
  timeForm.inputs["limitTime"] = stepperInput;

  final limitTimeActuation = TdUiActuation();
  limitTimeActuation.communicationProtocol = CommunicationProtocol.http;
  limitTimeActuation.securityScheme = SecurityScheme.none;
  limitTimeActuation.href =
      Uri.parse("http://192.168.0.36/things/led/properties/limitTime");

  timeForm.actuation = limitTimeActuation;

  limitTimeProperty.form = timeForm;
  thing.properties["limitTime"] = limitTimeProperty;

  return thing;
  }
}