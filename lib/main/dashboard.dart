import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/main/form/wrapper.dart';
import 'package:td_driven_ui/models/thingui/core/resource.dart';
import 'package:td_driven_ui/models/thingui/core/thing.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThingUiThing>(
      builder: (BuildContext context, ThingUiThing thing, Widget child) {
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

  buildResourceForm(Map<String, ThingUiResource> map) {
    final keys = map.keys;
    final children = keys.map((key) {
      final resource = map[key];
      return Provider.value(value: resource, child: FormWrapper());
    }).toList();
    return Column(children: children);
  }
}
