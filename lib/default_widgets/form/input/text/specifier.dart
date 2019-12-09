import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/default_widgets/form/input/text/subtypes/date.dart';
import 'package:td_driven_ui/default_widgets/form/input/text/subtypes/keyboard.dart';
import 'package:td_driven_ui/thing_ui_models/interaction/inputs/text/index.dart';
import 'package:td_driven_ui/thing_ui_models/interaction/inputs/text/types.dart';

class TdUiTextInputSpecifier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildInput(context);
  }

  static Widget buildInput(BuildContext context) {
    final input = Provider.of<TdUiTextInput>(context);
    //Default values
    var inputType = TextInputType.text;
    Widget child = TdUiKeyboardTextInput();

    switch (input.subType) {
      case TdUiTextInputType.plain:
        inputType = TextInputType.text;
        break;
      case TdUiTextInputType.email:
        inputType = TextInputType.emailAddress;
        break;
      case TdUiTextInputType.multiline:
        inputType = TextInputType.multiline;
        break;
      case TdUiTextInputType.phone:
        inputType = TextInputType.phone;
        break;
      case TdUiTextInputType.datetime:
        inputType = TextInputType.datetime;
        child = TdUiDateInputWidget();
        break;
    }
    return MultiProvider(providers: [
      Provider<TextInputType>.value(value: inputType),
      Provider.value(value: "")
    ], child: child);
  }
}
