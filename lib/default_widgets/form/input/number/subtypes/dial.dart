import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:spring_button/spring_button.dart';
import 'package:td_driven_ui/default_widgets/form/input/mixins.dart';
import 'package:td_driven_ui/thing_ui_models/thing_ui_models.dart';
import 'package:td_driven_ui/utils/color.dart';

class TdUiDialNumberInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TdUiDialNumberInputState();
}

const DialSize = 16.0;

class _TdUiDialNumberInputState extends State<TdUiDialNumberInput>
    with TdUiFormUpdater {
  var value = 0;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    value = Provider.of<int>(context);
  }

  @override
  Widget build(BuildContext context) {
    final input = Provider.of<TdUiNumberInput>(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: <Widget>[
            SleekCircularSlider(
              appearance: buildSliderAppearance(constraints),
              initialValue: 0,
              min: input.min,
              max: input.max,
              innerWidget: (value) => Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(value.truncate().toString(),
                          style: Theme.of(context)
                              .textTheme
                              .display2
                              .apply(color: Colors.black)),
                      Text(input.unit,
                          style: Theme.of(context)
                              .textTheme
                              .caption)
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(input.label,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle
                          .apply(color: Colors.grey))
                ],
              )),
              onChange: (value) {},
            ),
          ],
        );
      },
    );
  }

  CircularSliderAppearance buildSliderAppearance(BoxConstraints constraints) {
    final customWidth01 = CustomSliderWidths(
        trackWidth: 20, progressBarWidth: 20, shadowWidth: 25);
    final customColors01 = CustomSliderColors(
        dotColor: Colors.white.withOpacity(0.8),
        trackColor: Colors.grey[300],
        progressBarColors: List<Color>.generate(8, (index) {
          return Colors.blue[index * 100 + 100];
        }),
        shadowColor: Colors.black,
        shadowMaxOpacity: 0.08);

    final info = InfoProperties(
        modifier: (value) => value.truncate().toString(),
        mainLabelStyle:
            Theme.of(context).textTheme.display3.apply(color: Colors.black));

    return CircularSliderAppearance(
        customWidths: customWidth01,
        customColors: customColors01,
        infoProperties: info,
        startAngle: 140,
        angleRange: 260,
        size: constraints.maxWidth*0.65);
  }
}
