import 'package:td_driven_ui/thing_ui_models/actuation/actuator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Actuator {
  static Future<ActuationResponse> actuate(
      TdUiActuation actuation, Map<String, dynamic> parameters) async {
    var client = http.Client();
    try {
      // final parsedMap =
      // parameters.map((key, value) => MapEntry(key, value.toString()));
      final parsedMap = json.encode(parameters);
      var uriResponse = await client.put(actuation.href,
          headers: {"Content-Type": "application/json"}, body: parsedMap);
      client.close();
      print(uriResponse.body);
    } catch (e) {
      client.close();
      final response = ActuationResponse();
      response.successful = false;
      response.error = e.toString();
    }
    return ActuationResponse();
  }

  static Future<Map<String, dynamic>> get(
      TdUiActuation actuation) async {
    var client = http.Client();
    try {
      var uriResponse = await client.get(actuation.href);
      client.close();
      print(uriResponse.body);
      return json.decode(uriResponse.body);
    } catch (e) {
      client.close();
      return Map<String, dynamic>();
    }
  }
}

class ActuationResponse {
  bool successful = true;
  String error;
}
