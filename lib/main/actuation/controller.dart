import 'package:td_driven_ui/main/actuation/actuator/http.dart';
import 'package:td_driven_ui/models/actuation/request.dart';
import 'package:td_driven_ui/models/actuation/request_response.dart';
import 'package:td_driven_ui/models/thingui/actuation/index.dart';
import 'package:td_driven_ui/models/tmr/thing.dart';

class ActuationController {
  TmrThing thing;
  Map<String, ActuationRequest> currentRequests =
      Map<String, ActuationRequest>();

  Future<ActuationResponse> actuate(
      ActuationRequest request, String resourceID) async {
    if (currentRequests.containsKey(resourceID)) {
      return currentRequests[resourceID].response;
    }

    switch (request.actuation.communicationProtocol) {
      case CommunicationProtocol.http:
        return HttpActuator().actuate(request);
      case CommunicationProtocol.mqtt:
        // TODO: Handle this case.
        break;
      case CommunicationProtocol.coap:
        // TODO: Handle this case.
        break;
      case CommunicationProtocol.objectForm:
        // TODO: Handle this case.
        break;
    }
  }
}
