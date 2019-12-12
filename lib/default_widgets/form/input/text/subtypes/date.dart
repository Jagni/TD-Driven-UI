import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/default_widgets/form/index.dart';
import 'package:td_driven_ui/default_widgets/form/input/mixins.dart';
import 'package:td_driven_ui/thing_ui_models/thing_ui_models.dart';

class TdUiDateInputWidget extends StatefulWidget {
  const TdUiDateInputWidget({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _TdUiDateInputWidgetState();
}

class _TdUiDateInputWidgetState extends State<TdUiDateInputWidget>
    with TdUiFormUpdater {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TextEditingController>(context);
    final readOnly = Provider.of<TdUiFormState>(context).form.readOnly;
    final label = Provider.of<TdUiTextInput>(context).label;

    return DateTimeField(
        controller: controller,
        readOnly: true,
        enabled: !readOnly,
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
