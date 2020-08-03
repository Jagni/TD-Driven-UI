import 'package:td_driven_ui/models/actuation/request_response.dart';
import 'package:td_driven_ui/models/thingui/actuation/actuation.dart';

class ActuationRequest {
  ThingUiActuation actuation;
  Map<String, dynamic> parameters = Map<String, dynamic>();
  ActuationResponse response = ActuationResponse();
}
