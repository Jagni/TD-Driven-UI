import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/default_widgets/form/input/mixins.dart';
import 'package:td_driven_ui/thing_ui_models/thing_ui_models.dart';

class TdUiCheckboxBooleanInput extends StatefulWidget {
  @override
  State<TdUiCheckboxBooleanInput> createState() =>
      _TdUiCheckboxBooleanInputState();
}

class _TdUiCheckboxBooleanInputState extends State<TdUiCheckboxBooleanInput>
    with TdUiFormUpdater {
  var value = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    value = Provider.of<bool>(context);
  }

  @override
  Widget build(BuildContext context) {
    final input = Provider.of<TdUiBooleanInput>(context);

    Text descriptionText;
    if (input.description.isNotEmpty) {
      descriptionText = Text(
        input.description,
        style: Theme.of(context).textTheme.caption,
      );
    }

    return Card(
            child: InkWell(
              onTap: didTap,
                          child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      input.label,
                      style: Theme.of(context).textTheme.title,
                    ),
                    descriptionText
                  ].where((child) => child != null).toList(),
                ),
          ),
          Center(
                child: Checkbox(
                  value: value,
                  onChanged: (value) => didTap(),
                ),
          ),
        ],
      ),
              ),
            ),
    );
  }

  didTap() {
    setState(() {
      value = !value;
    });
    updateEditingValue(value);
  }
}
