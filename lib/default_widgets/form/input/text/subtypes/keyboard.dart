import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/default_widgets/form/index.dart';
import 'package:td_driven_ui/thing_ui_models/thing_ui_models.dart';

class TdUiKeyboardTextInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TdUiKeyboardTextInputState();
}

class _TdUiKeyboardTextInputState extends State<TdUiKeyboardTextInput> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TextEditingController>(context);
    final form = Provider.of<TdUiFormState>(context).form;
    final type = Provider.of<TextInputType>(context);
    final readOnly = form.readOnly;

    final label = Provider.of<TdUiTextInput>(context).label;

    return TextField(
        controller: controller,
        readOnly: readOnly,
        keyboardType: type,
        minLines: 1,
        maxLines: 5,
        decoration: InputDecoration(
          labelText: label,
          fillColor: Colors.white,
        ));
  }
}
