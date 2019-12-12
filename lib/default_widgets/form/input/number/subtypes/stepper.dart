import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spring_button/spring_button.dart';
import 'package:td_driven_ui/default_widgets/form/input/mixins.dart';
import 'package:td_driven_ui/thing_ui_models/thing_ui_models.dart';

class TdUiStepperNumberInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TdUiStepperNumberInputState();
}

const stepperSize = 16.0;

class _TdUiStepperNumberInputState extends State<TdUiStepperNumberInput>
    with TdUiFormUpdater {
  var value = 0;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final input = Provider.of<TdUiNumberInput>(context);

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 48,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: Text(input.label,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SpringButton(
                SpringButtonType.OnlyScale,
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(stepperSize),
                    child: Icon(
                      Icons.remove,
                      color: Theme.of(context).accentIconTheme.color,
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      image: null,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2.0,
                            offset: Offset(0, 1)),
                      ]),
                ),
                onTap: didTapDecrease,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  value.toString(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .display1,
                ),
              ),
              SizedBox(width: 16),
              SpringButton(
                SpringButtonType.OnlyScale,
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(stepperSize),
                    child: Icon(
                      Icons.add,
                      color: Theme.of(context).accentIconTheme.color,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    image: null,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2.0,
                          offset: Offset(0, 1)),
                    ],
                  ),
                ),
                onTap: didTapIncrease,
              ),
            ],
          )
        ]);
  }

  didTapDecrease() {
    final input = Provider.of<TdUiNumberInput>(context);
    setState(() {
      if (input.min == null) {
        value--;
      } else {
        if (value > input.min) {
          value--;
        }
      }
    });

    updateEditingValue(value);
  }

  didTapIncrease() {
    final input = Provider.of<TdUiNumberInput>(context);
    setState(() {
      if (input.max == null) {
        value++;
      } else {
        if (value < input.max) {
          value++;
        }
      }
    });

    updateEditingValue(value);
  }
}
