import 'package:td_driven_ui/models/actuation/request.dart';
import 'package:td_driven_ui/models/actuation/request_response.dart';

abstract class Actuator {
  Future<ActuationResponse> actuate(ActuationRequest request);
}
