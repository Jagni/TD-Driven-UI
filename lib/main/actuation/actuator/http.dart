import 'package:td_driven_ui/models/actuation/request.dart';
import 'package:td_driven_ui/models/actuation/request_response.dart';
import 'package:td_driven_ui/models/actuation/request_status.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:td_driven_ui/models/thingui/core/resource.dart';

import 'index.dart';

class HttpActuator extends Actuator {
  Future<ActuationResponse> actuate(ActuationRequest request) async {
    var client = http.Client();
    var response = ActuationResponse();
    try {
      final parsedMap = json.encode(request.parameters);
      var uriResponse = await client.put(request.actuation.href,
          headers: {"Content-Type": "application/json"}, body: parsedMap);
      client.close();
      response.status = RequestStatus.successful;
      response.message = uriResponse.body;
    } catch (e) {
      client.close();
      response.status = RequestStatus.successful;
      response.message = e.toString();
    }
    return response;
  }

  Future<Map<String, dynamic>> getResource(ThingUiResource resource) async {
    var client = http.Client();
    try {
      var uriResponse = await client.get(resource.actuation.href);
      client.close();
      print(uriResponse.body);
      return json.decode(uriResponse.body);
    } catch (e) {
      client.close();
      return Map<String, dynamic>();
    }
  }
}
