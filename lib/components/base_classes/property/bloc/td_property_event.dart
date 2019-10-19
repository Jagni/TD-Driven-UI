import 'package:equatable/equatable.dart';

abstract class TDPropertyEvent extends Equatable {}

class SubmitTDPropertyValue extends TDPropertyEvent {
  final dynamic value;
  SubmitTDPropertyValue(this.value);

  @override
  List<Object> get props => [value];
}

class StartEditingTDProperty extends TDPropertyEvent {
  final dynamic value;
  StartEditingTDProperty(this.value);
  
  @override
  List<Object> get props => [value];
}

class StopEditingTDProperty extends TDPropertyEvent {
  final dynamic value;
  StopEditingTDProperty(this.value);

  @override
  List<Object> get props => [value];
}