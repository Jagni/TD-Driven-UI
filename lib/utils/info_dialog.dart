import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/thing_ui_models/thing_ui_models.dart';

Widget buildInfoButton(BuildContext context) {
    final input = Provider.of<TdUiInput>(context);
    if (input.description.isNotEmpty) {
      return IconButton(
          icon: Icon(Icons.info_outline, color: Theme.of(context).accentColor ),
          onPressed: () {
            showDialog(
                context: context,
                child: AlertDialog(
                  title: Text(input.label),
                  content: Text(input.description),
                ));
          });
    }
    return null;
  }