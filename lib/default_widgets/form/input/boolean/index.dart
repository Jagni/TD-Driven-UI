import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/default_widgets/form/input/boolean/subtypes/factory.dart';
import 'package:td_driven_ui/thing_ui_models/interaction/inputs/boolean/index.dart';

class TdUiBooleanInputWidget extends StatefulWidget {
  @override
  State<TdUiBooleanInputWidget> createState() => _BooleanInputState();
}

class _BooleanInputState extends State<TdUiBooleanInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TdUiBooleanInput>(
        builder: (BuildContext context, TdUiBooleanInput input, Widget child) {
      return BooleanInputWidgetFactory.build(input);
    });
  }
}
