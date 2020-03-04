import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/actuator.dart';
import 'package:td_driven_ui/default_widgets/form/input/wrapper.dart';
import 'package:td_driven_ui/thing_ui_models/thing_ui_models.dart';

class TdUiFormWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TdUiFormWidgetState();
}

class TdUiFormWidgetState extends State<TdUiFormWidget> {
  TdUiFormState formState;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TdUiForm>(
      builder: (BuildContext context, TdUiForm form, Widget child) {
        final keys = form.inputs.keys;
        formState = TdUiFormState(form);

        final children = keys.map((key) {
          final input = form.inputs[key];
          return MultiProvider(
            providers: [
              Provider.value(value: ValueKey(key)),
              Provider.value(value: input)
            ],
            child: TdUiInputWrapper(),
          );
        }).toList();

        return ChangeNotifierProvider(
            create: (context) => TdUiFormState(form),
            child: Column(children: children));
      },
    );
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
        _actuate({key: value});
        edited = false;
      }
    }
  }

  submit() {
    _actuate(_editingValues);
  }

  Future<ActuationResponse> _actuate(Map<String, dynamic> parameters) async {
    actuating = true;
    notifyListeners();

    final response = await Actuator.actuate(form.actuation, _editingValues);

    actuating = false;
    edited = false;
    notifyListeners();

    return response;
  }

  ///Most recent value received from the associated Thng
  final Map<String, dynamic> _thingValues = {};
  Map<String, dynamic> get thingValues {
    //TODO: watch new values and update map
    return Map<String, dynamic>.unmodifiable(_thingValues);
  }

  ///Wether the user has modified any input after receiving the current ThingValues.
  ///
  ///Used to enable the submit button and decide if an editing value should be updated.
  var edited = false;
}
