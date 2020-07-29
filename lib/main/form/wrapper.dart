import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/main/form/change_notifier.dart';
import 'package:td_driven_ui/main/form/input/wrapper.dart';
import 'package:td_driven_ui/models/thingui/core/resource.dart';
import 'package:td_driven_ui/models/thingui/index.dart';
import 'package:td_driven_ui/utils/info_dialog.dart';

class FormWrapper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FormWrapperState();
}

class FormWrapperState extends State<FormWrapper> {
  FormChangeNotifier changeNotifier;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThingUiResource>(
      builder: (BuildContext context, ThingUiResource resource, Widget child) {
        final keys = resource.inputs.keys;

        final children = keys.map((key) {
          final input = resource.inputs[key];
          return MultiProvider(
            providers: [
              Provider.value(value: ValueKey(key)),
              Provider.value(value: input)
            ],
            child: Stack(children: [
              InputWrapper(),
              Align(
                  alignment: Alignment.topRight,
                  child: buildInfoButton(context))
            ]),
          );
        }).toList();

        return ChangeNotifierProvider(
            create: (context) => FormChangeNotifier(resource),
            child: Column(children: children));
      },
    );
  }
}
