import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/default_widgets/form/index.dart';
import 'package:td_driven_ui/default_widgets/form/input/text/specifier.dart';

class TdUiTextInputWrapper extends StatefulWidget {
  const TdUiTextInputWrapper({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _TdUiTextInputWrapperState();
}

class _TdUiTextInputWrapperState extends State<TdUiTextInputWrapper> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
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
