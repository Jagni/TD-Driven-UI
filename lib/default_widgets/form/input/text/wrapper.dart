import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/default_widgets/form/index.dart';
import 'package:td_driven_ui/default_widgets/form/input/mixins.dart';
import 'package:td_driven_ui/default_widgets/form/input/text/specifier.dart';
import 'package:td_driven_ui/thing_ui_models/interaction/inputs/text/index.dart';

class TdUiTextInputWrapper extends StatefulWidget {
  const TdUiTextInputWrapper({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _TdUiTextInputWidget();
}

class _TdUiTextInputWidget extends State<TdUiTextInputWrapper>
    with TdUiFormUpdater {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      updateEditingValue(controller.text);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final key = widget.key as ValueKey<String>;
    controller.text = Provider.of<TdUiFormState>(context).thingValues[key];
  }

  @override
  Widget build(BuildContext context) {
    return ListenableProvider<TextEditingController>.value(
        child: TdUiTextInputSpecifier(), value: controller);
  }
}
