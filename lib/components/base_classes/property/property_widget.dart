import 'package:flutter/widgets.dart';
import 'package:td_driven_ui/components/base_classes/property/bloc/bloc.dart';

import 'model.dart';

///Concrete implementations must override ``createState()`` returning a concrete
///implementation of PropertyWidgetState
abstract class PropertyWidget extends StatefulWidget{
  final TDProperty property;
  PropertyWidget(this.property); 

  // @override
  // _PropertyWidgetState createState() => _PropertyWidgetState();
}

///
abstract class PropertyWidgetState extends State<PropertyWidget>{
  final bloc = TDPropertyBloc();
  var shownValue;
  var editingValue;

  void editProperty(){
    bloc.dispatch(StartEditingTDProperty(shownValue));
  }

  void submitEdition() {
    bloc.dispatch(SubmitTDPropertyValue(editingValue));
  }

  void finishEdition() {
    shownValue = editingValue;
    bloc.dispatch(StopEditingTDProperty(shownValue));
  }

  void cancelEdition(){
    bloc.dispatch(StopEditingTDProperty(shownValue));
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }
}