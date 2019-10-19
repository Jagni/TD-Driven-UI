import 'package:flutter/widgets.dart';
import 'package:td_driven_ui/components/base_classes/property/model.dart';
import 'package:td_driven_ui/components/default_widgets/properties/text_field.dart';

class TDComponentAggregator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var nameProperty = TDProperty();
    nameProperty.name = "Nome";
    nameProperty.value = "Oi som teste";

    var descriptionProperty = TDProperty();
    descriptionProperty.name = "Descrição";
    descriptionProperty.value = "Oi som teste";

    return Column(children: [
      TDPropertyTextField(nameProperty),
      SizedBox(height: 16),
      TDPropertyTextField(descriptionProperty),
    ]);
  }
}
