import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/default_widgets/form/index.dart';

class TdUiDateInputWidget extends StatefulWidget {
  const TdUiDateInputWidget({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _TdUiDateInputWidgetState();
}

class _TdUiDateInputWidgetState extends State<TdUiDateInputWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TextEditingController>(context);
    final readOnly = Provider.of<TdUiFormState>(context).form.readOnly;

    return DateTimeField(
        controller: controller,
        readOnly: true,
        enabled: !readOnly,
        decoration: InputDecoration(
          labelText: "Data",
          fillColor: Colors.white,
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
