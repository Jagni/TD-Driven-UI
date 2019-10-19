import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class TDPropertyBloc extends Bloc<TDPropertyEvent, TDPropertyState> {
  @override
  TDPropertyState get initialState => TDPropertyExhibition(null);

  @override
  Stream<TDPropertyState> mapEventToState(
    TDPropertyEvent event,
  ) async* {
    if (event is StartEditingTDProperty){
      yield(TDPropertyEdition(event.value));
    }

    if (event is SubmitTDPropertyValue){
      yield(TDPropertyLoadingSubmit());

      var message = await _propertyActuation(event.value);

      yield(TDPropertySubmitSuccess(message));
    }

    if (event is StopEditingTDProperty){
      yield(TDPropertyExhibition(event.value));
    }
  }

  Future<String> _propertyActuation(String newValue) {
    // Simulate network delay
    return Future.delayed(
      Duration(seconds: 2),
      () {
        return "Valor atualizado";
      },
    );
  }
}
