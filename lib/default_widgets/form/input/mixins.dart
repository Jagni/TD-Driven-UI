import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/default_widgets/form/index.dart';

mixin TdUiFormUpdater<T extends StatefulWidget> on State<T> {
  dynamic value;

  ///Automatically obtains and updates the current context's TdUiFormState corresponding editingValues entry
  ///
  ///Key: the state's widget Key
  ///
  ///Value: passed as parameter
  updateEditingValue(dynamic value) {
    var form = Provider.of<TdUiFormState>(context);
    final key = Provider.of<ValueKey<String>>(context);
    form.updateEditingValue(key.value, value);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final key = Provider.of<ValueKey<String>>(context);
    final formState = Provider.of<TdUiFormState>(context);
    if (formState.thingValues.containsKey(key.value)) {
      final newValue = formState.thingValues[key.value];
      if (value != newValue) {
        setState(() {
          value = newValue;
        });
        valueChanged(newValue);
      }
    }
  }

  void valueChanged(dynamic newValue) {}
}
