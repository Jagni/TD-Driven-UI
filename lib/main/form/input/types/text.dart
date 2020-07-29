import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/main/form/input/mixins.dart';
import 'package:td_driven_ui/models/thingui/index.dart';
import 'package:td_driven_ui/utils/info_dialog.dart';

class ThingUiTextInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ThingUiTextInputState();
}

class _ThingUiTextInputState extends State<ThingUiTextInput>
    with ThingUiCustomInputState {
  valueChanged(dynamic newValue) {
    final controller = Provider.of<TextEditingController>(context);
    controller.text = newValue;
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TextEditingController>(context);

    return TextFormField(
        controller: controller,
        onSaved: (value) => updateEditingValue(value),
        validator: (value) => "",
        minLines: 1,
        maxLines: 5,
        decoration: buildDecoration());
  }

  InputDecoration buildDecoration() {
    final label = Provider.of<ThingUiInput>(context).label;
    final infoButton = buildInfoButton(context);

    if (infoButton != null) {
      return InputDecoration(labelText: label, suffix: infoButton);
    }
    return InputDecoration(
      labelText: label,
    );
  }
}
