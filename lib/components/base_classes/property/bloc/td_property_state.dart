import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TDPropertyState extends Equatable {}

class TDPropertyExhibition extends TDPropertyState {
  final dynamic value;
  
  TDPropertyExhibition(this.value);
  
  @override
  List<Object> get props => [value];
}

class TDPropertyEdition  extends TDPropertyState {
  final dynamic initialValue;
  
  TDPropertyEdition(this.initialValue);

  @override
  List<Object> get props => [initialValue];
}

class TDPropertyLoadingSubmit extends TDPropertyState {
  @override
  List<Object> get props => [];
}

class TDPropertySubmitSuccess extends TDPropertyState {
  final String message;

  TDPropertySubmitSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class TDPropertySubmitFail extends TDPropertyState {
  final String message;

  TDPropertySubmitFail(this.message);

  @override
  List<Object> get props => [message];
}
