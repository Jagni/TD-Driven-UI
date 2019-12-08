import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/Actuator.dart';
import 'package:td_driven_ui/default_widgets/form/input/factory.dart';
import 'package:td_driven_ui/thing_ui_models/interaction/inputs/text/index.dart';
import 'package:td_driven_ui/thing_ui_models/thing_ui_models.dart';

class TdUiFormWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TdUiFormWidgetState();
}

class TdUiFormWidgetState extends State<TdUiFormWidget> {
  @override
  Widget build(BuildContext context) {
    
    return Provider.value(
        value: this,
        child: Column(
          children: [],
        ));
  }
}

class TdUiFormState with ChangeNotifier {
  final TdUiForm form;
  TdUiFormState(this.form);

  ///Wether an actuation is being made now
  var actuating = false;

  ///Values that are currently being shown in the tree by the user.
  ///Should be updated by child InputWidgets.
  var _editingValues = Map<String, dynamic>();

  updateEditingValue(String key, value) {
    edited = true;
    if (!form.readOnly) {
      _editingValues[key] = value;

      if (!form.showsSubmitButton) {
        //TODO: actuate immediately: await actuation then notify listeners
        actuate({key: value});
        edited = false;
      }
    }
  }

  Future<ActuationResponse> actuate(Map<String, dynamic> parameters) async {
    actuating = true;
    notifyListeners();

    final response = await Actuator.actuate(form.actuation, _editingValues);

    actuating = false;
    edited = false;
    notifyListeners();

    return response;
  }

  ///Most recent value received from the associated Thng
  Map<String, dynamic> get thingValues {
    return Map<String, dynamic>();
  }

  ///Wether the user has modified any input after receiving the current ThingValues.
  ///Used to enable the submit button and decide if an editing values should be updated.
  var edited = false;
}
