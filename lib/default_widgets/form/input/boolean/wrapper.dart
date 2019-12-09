import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/default_widgets/form/index.dart';
import 'package:td_driven_ui/default_widgets/form/input/boolean/specifier.dart';
import 'package:td_driven_ui/default_widgets/form/input/text/specifier.dart';

class TdUiBooleanInputWrapper extends StatefulWidget {
  const TdUiBooleanInputWrapper({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _TdUiBooleanInputWrapperState();
}

class _TdUiBooleanInputWrapperState extends State<TdUiBooleanInputWrapper> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TdUiBooleanInputSpecifier();
  }
}
