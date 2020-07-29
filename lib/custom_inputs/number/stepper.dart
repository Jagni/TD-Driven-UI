import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spring_button/spring_button.dart';
import 'package:td_driven_ui/main/form/input/mixins.dart';
import 'package:td_driven_ui/models/thingui/index.dart';

class TdUiStepperNumberInput extends StatefulWidget with ThingUiCustomInput {
  @override
  State<StatefulWidget> createState() => _TdUiStepperNumberInputState();
}

const stepperSize = 16.0;

class _TdUiStepperNumberInputState extends State<TdUiStepperNumberInput>
    with ThingUiCustomInputState {
  double defaultValue = 0.0;

  @override
  void initState() {
    super.initState();
    value = defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    final input = Provider.of<ThingUiInput>(context);

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
                        style: Theme.of(context).textTheme.subtitle2)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SpringButton(
                SpringButtonType.OnlyScale,
                Container(
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    shape: CircleBorder(),
                    child: Padding(
                      padding: const EdgeInsets.all(stepperSize),
                      child: Icon(
                        Icons.remove,
                        color: Theme.of(context).accentIconTheme.color,
                      ),
                    ),
                  ),
                ),
                onTap: didTapDecrease,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  value == null ? defaultValue.toString() : value.toString(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              SizedBox(width: 16),
              SpringButton(
                SpringButtonType.OnlyScale,
                Container(
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    shape: CircleBorder(),
                    child: Padding(
                      padding: const EdgeInsets.all(stepperSize),
                      child: Icon(
                        Icons.add,
                        color: Theme.of(context).accentIconTheme.color,
                      ),
                    ),
                  ),
                ),
                onTap: didTapIncrease,
              ),
            ],
          )
        ]);
  }

  didTapDecrease() {
    final input = Provider.of<ThingUiInput>(context, listen: false);
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
    final input = Provider.of<ThingUiInput>(context, listen: false);
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
