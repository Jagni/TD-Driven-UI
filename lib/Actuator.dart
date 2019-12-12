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
      print(uriResponse.body);
    } finally {
      client.close();
    }
    return ActuationResponse();
  }
}

class ActuationResponse {
  bool successful = true;
  String error;
}
