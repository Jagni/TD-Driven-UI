import 'package:td_driven_ui/models/actuation/request.dart';
import 'package:td_driven_ui/models/actuation/request_response.dart';
import 'package:td_driven_ui/models/thingui/core/resource.dart';

abstract class Actuator {
  Future<ActuationResponse> actuate(ActuationRequest request);
  Future<Map<String, dynamic>> getResource(ThingUiResource resource);
}
