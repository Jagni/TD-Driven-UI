import 'package:td_driven_ui/models/thingui/actuation/communication_protocols.dart';
import 'package:td_driven_ui/models/thingui/actuation/security_schemes.dart';

class ThingUiActuation {
  Uri href = Uri(path: "");
  var communicationProtocol = CommunicationProtocol.http;
  var securityScheme = SecurityScheme.basic;
}
