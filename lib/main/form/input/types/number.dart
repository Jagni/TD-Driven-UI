import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/main/form/input/mixins.dart';
import 'package:td_driven_ui/models/thingui/index.dart';
import 'package:td_driven_ui/utils/info_dialog.dart';

class ThingUiNumberInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ThingUiNumberInputState();
}

class _ThingUiNumberInputState extends State<ThingUiNumberInput>
    with ThingUiCustomInputState {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: TextInputType.number,
        onFieldSubmitted: (value) => FocusScope.of(context).unfocus(),
        inputFormatters: <TextInputFormatter>[
          WhitelistingTextInputFormatter.digitsOnly
        ],
        onSaved: (value) => updateEditingValue(value),
        minLines: 1,
        maxLines: 1,
        decoration: buildDecoration());
  }

  InputDecoration buildDecoration() {
    final input = Provider.of<ThingUiInput>(context, listen: false);

    return InputDecoration(
        labelText: input.label,
        hintText: input.description,
        suffixText: "(" + input.unit + ")");
  }
}
