import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/main/form/input/mixins.dart';
import 'package:td_driven_ui/models/thingui/index.dart';

class ThingUiBooleanInput extends StatefulWidget {
  @override
  State<ThingUiBooleanInput> createState() => _ThingUiBooleanInputState();
}

class _ThingUiBooleanInputState extends State<ThingUiBooleanInput>
    with ThingUiCustomInputState {
  var value = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    value = Provider.of<bool>(context);
  }

  @override
  Widget build(BuildContext context) {
    final input = Provider.of<ThingUiInput>(context);

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
                      style: Theme.of(context).textTheme.headline6,
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
