import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:td_driven_ui/main/form/input/mixins.dart';
import 'package:td_driven_ui/models/thingui/index.dart';
import 'package:tinycolor/tinycolor.dart';

class TdUiDialNumberInput extends StatefulWidget with ThingUiCustomInput {
  final ValueKey<String> dialKey = ValueKey<String>("dial");
  @override
  State<StatefulWidget> createState() => _TdUiDialNumberInputState();
}

const DialSize = 16.0;

class _TdUiDialNumberInputState extends State<TdUiDialNumberInput>
    with ThingUiCustomInputState {
  double defaultValue = 0.0;

  @override
  Widget build(BuildContext context) {
    final input = Provider.of<ThingUiInput>(context);
    var label = input.label;
    if (input.unit.isNotEmpty) {
      label += " (" + input.unit + ")";
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SleekCircularSlider(
                appearance: buildSliderAppearance(constraints),
                initialValue: value == null ? defaultValue : value + .0,
                min: input.min,
                max: input.max,
                innerWidget: (value) => Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(value.truncate().toString(),
                        style: Theme.of(context).textTheme.headline3),
                    SizedBox(height: 8),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(label,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.subtitle2),
                      ),
                    )
                  ],
                )),
                onChangeEnd: didChangeValue,
              ),
            ],
          ),
        );
      },
    );
  }

  didChangeValue(double value) {
    updateEditingValue(value);
  }

  CircularSliderAppearance buildSliderAppearance(BoxConstraints constraints) {
    final customWidth01 = CustomSliderWidths(
        trackWidth: 20, progressBarWidth: 20, shadowWidth: 25, handlerSize: 5);
    final customColors01 = CustomSliderColors(
        dotColor: Theme.of(context).scaffoldBackgroundColor,
        trackColor:
            TinyColor(Theme.of(context).scaffoldBackgroundColor).darken().color,
        progressBarColors: [
          Theme.of(context).accentColor,
          Theme.of(context).accentColor
        ],
        shadowColor: Colors.black,
        shadowMaxOpacity: 0.08);

    final info = InfoProperties(
        modifier: (value) => value.truncate().toString(),
        mainLabelStyle: Theme.of(context).textTheme.headline2);

    return CircularSliderAppearance(
        customWidths: customWidth01,
        customColors: customColors01,
        infoProperties: info,
        startAngle: 120,
        angleRange: 300,
        size: constraints.maxWidth * 0.65);
  }
}
