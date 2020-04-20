import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/default_widgets/form/input/mixins.dart';
import 'package:td_driven_ui/thing_ui_models/thing_ui_models.dart';
import 'package:td_driven_ui/utils/info_dialog.dart';

class TdUiKeyboardTextInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TdUiKeyboardTextInputState();
}

class _TdUiKeyboardTextInputState extends State<TdUiKeyboardTextInput> with TdUiFormUpdater {
  
  valueChanged(dynamic newValue) {
    final controller = Provider.of<TextEditingController>(context);
    controller.text = newValue;
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TextEditingController>(context);
    final type = Provider.of<TextInputType>(context);

    return TextField(
        controller: controller,
        keyboardType: type,
        onSubmitted: (value) => updateEditingValue(value),
        minLines: 1,
        maxLines: 5,
        decoration: buildDecoration());
  }

  InputDecoration buildDecoration(){
    final label = Provider.of<TdUiTextInput>(context).label;
    final infoButton = buildInfoButton(context);

    if (infoButton != null){
    return InputDecoration(
          labelText: label,
          suffix: infoButton
        );
    }
    return InputDecoration(
          labelText: label,
        );
  }
}
