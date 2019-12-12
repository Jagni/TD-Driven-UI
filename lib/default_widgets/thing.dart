import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/default_widgets/form/index.dart';
import 'package:td_driven_ui/default_widgets/form/input/wrapper.dart';
import 'package:td_driven_ui/thing_ui_models/core/resource.dart';
import 'package:td_driven_ui/thing_ui_models/core/thing.dart';
import 'package:td_driven_ui/thing_ui_models/thing_ui_models.dart';

class TdUiThingWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TdUiThingWidgetState();
}

class TdUiThingWidgetState extends State<TdUiThingWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Thing>(
      builder: (BuildContext context, Thing thing, Widget child) {
        return SingleChildScrollView(
          child: Column(children: [
            buildResourceForm(thing.properties),
            buildResourceForm(thing.actions),
            buildResourceForm(thing.events),
          ]),
        );
      },
    );
  }

  buildResourceForm(Map<String, Resource> map) {
    final keys = map.keys;
    final children = keys.map((key) {
      final property = map[key];
      return Provider.value(value: property.form, child: TdUiFormWidget());
    }).toList();
    return Column(children: children);
  }
}
