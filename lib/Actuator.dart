import 'package:td_driven_ui/thing_ui_models/actuation/actuator.dart';

class Actuator {
  static Future<ActuationResponse> actuate(
      TdUiActuation actuation, Map<String, dynamic> parameters) async {
    //TODO: Actuation network calls
    return ActuationResponse();
  }
}

class ActuationResponse {
  bool successful = true;
  String error;
}
