import 'package:flutter/widgets.dart';
import 'package:td_driven_ui/main/actuation/controller.dart';
import 'package:td_driven_ui/models/actuation/request.dart';
import 'package:td_driven_ui/models/actuation/request_response.dart';
import 'package:td_driven_ui/models/thingui/core/resource.dart';
import 'package:td_driven_ui/models/thingui/index.dart';

class FormChangeNotifier with ChangeNotifier {
  ThingUiResource resource;
  ActuationController controller;
  bool actuating;
  ActuationResponse response;

  FormChangeNotifier(ThingUiResource resource) {
    this.resource = resource;
  }

  ///Values that are currently being shown in the tree by the user.
  ///Should be updated by child InputWidgets.
  var _editingValues = Map<String, dynamic>();

  updateEditingValue(String key, value) {
    edited = true;
    _editingValues[key] = value;

    if (!resource.showsSubmitButton) {
      requestSubmission({key: value});
      edited = false;
    }
  }

  requestSubmission(Map<String, dynamic> parameters) async {
    actuating = true;
    notifyListeners();

    final request = ActuationRequest();
    response = await controller.actuate(request, resource.description);
    actuating = false;
    notifyListeners();
  }

  ///Wether the user has modified an input after the last actuation.
  ///
  ///Used to enable the submit button and decide if an editing value should be updated.
  var edited = false;
}
