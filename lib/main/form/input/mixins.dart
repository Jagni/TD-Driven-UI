import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/main/form/change_notifier.dart';
import 'package:td_driven_ui/models/thingui/interaction/inputs/index.dart';
import 'package:td_driven_ui/models/tmr/resource.dart';

mixin ThingUiCustomInput on StatefulWidget {}
mixin ThingUiCustomInputState<T extends StatefulWidget> on State<T> {
  dynamic value;

  ///Automatically obtains and updates the current context's TdUiFormState corresponding editingValues entry
  ///
  ///Key: the state's widget Key
  ///
  ///Value: passed as parameter
  updateEditingValue(dynamic value) {
    var form = Provider.of<FormChangeNotifier>(context, listen: false);
    final key = Provider.of<ValueKey<String>>(context, listen: false);
    form.updateEditingValue(key.value, value);
  }

  void valueChanged(dynamic newValue) {}

  ThingUiInput getInput() {
    return Provider.of<ThingUiInput>(context, listen: false);
  }

  TmrResource getTmrResource() {
    return Provider.of<TmrResource>(context, listen: false);
  }
}
