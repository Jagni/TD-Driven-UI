import 'package:td_driven_ui/main/actuation/actuator/http.dart';
import 'package:td_driven_ui/models/actuation/request.dart';
import 'package:td_driven_ui/models/actuation/request_response.dart';

class ActuationController {
  Future<ActuationResponse> actuate(
      ActuationRequest request, String resourceID) async {
    final response = await HttpActuator().actuate(request);
    return response;
  }
}
