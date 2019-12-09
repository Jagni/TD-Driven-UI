import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/default_widgets/form/index.dart';

mixin TdUiFormUpdater<T extends StatefulWidget> on State<T> {
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
}
