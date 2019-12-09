import 'package:td_driven_ui/thing_ui_models/actuation/communication_protocols.dart';
import 'package:td_driven_ui/thing_ui_models/actuation/security_schemes.dart';

class TdUiActuation {
  Uri href = Uri(path: "");
  var communicationProtocol = CommunicationProtocol.http;
  var securityScheme = SecurityScheme.basic;
}
