import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/default_widgets/form/index.dart';

class CheckboxBooleanInput extends StatefulWidget{
  @override
  State<CheckboxBooleanInput> createState() => _CheckboxBooleanInputState();
  
}

class _CheckboxBooleanInputState extends State<CheckboxBooleanInput>{
  @override
  Widget build(BuildContext context) {
    return Center(child: Checkbox(value: true, onChanged: (bool value) {
      var form = Provider.of<TdUiFormState>(context);
      final key = widget.key as ValueKey<String>;
      form.updateEditingValue(key.value, value);
    },));
  }
}