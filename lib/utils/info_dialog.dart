import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/models/thingui/index.dart';

Widget buildInfoButton(BuildContext context) {
  final input = Provider.of<ThingUiResource>(context);
  if (input.description != null && input.description.isNotEmpty) {
    return IconButton(
        alignment: Alignment.centerRight,
        icon: Icon(Icons.info_outline, color: Theme.of(context).accentColor),
        onPressed: () {
          showDialog(
              context: context,
              child: AlertDialog(
                title: Text(input.name),
                content: Text(input.description),
              ));
        });
  }
  return Container();
}
