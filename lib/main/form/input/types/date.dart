import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/main/form/input/mixins.dart';
import 'package:td_driven_ui/models/thingui/index.dart';

class ThingUiDateInput extends StatefulWidget {
  const ThingUiDateInput({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ThingUiDateInputState();
}

class _ThingUiDateInputState extends State<ThingUiDateInput>
    with ThingUiCustomInputState {
  valueChanged(dynamic newValue) {
    final controller = Provider.of<TextEditingController>(context);
    controller.text = newValue;
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TextEditingController>(context);
    final label = Provider.of<ThingUiInput>(context).label;

    return DateTimeField(
        controller: controller,
        readOnly: true,
        onChanged: (date) =>
            updateEditingValue(DateFormat('dd/MM/yyyy').format(date)),
        decoration: InputDecoration(
          labelText: label,
        ),
        format: DateFormat('dd/MM/yyyy'),
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        });
  }
}
