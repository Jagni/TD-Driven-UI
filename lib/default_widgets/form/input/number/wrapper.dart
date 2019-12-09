import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/default_widgets/form/input/number/specifier.dart';
import 'package:td_driven_ui/utils/info_dialog.dart';

class TdUiNumberInputWrapper extends StatelessWidget {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var children = [
        Align(alignment: Alignment.center, child: TdUiNumberInputSpecifier()),
      ];
    final infoButton = buildInfoButton(context);
    if (infoButton != null){
      children.add(Align(alignment: Alignment.topRight, child: infoButton));
    }
    return ListenableProvider<TextEditingController>.value(
      child: Stack(children: children),
      value: controller,
    );
  }

}
