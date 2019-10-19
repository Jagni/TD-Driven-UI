import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:td_driven_ui/components/base_classes/property/bloc/bloc.dart';
import 'package:td_driven_ui/components/base_classes/property/model.dart';
import 'package:td_driven_ui/components/base_classes/property/property_widget.dart';

class TDPropertyTextField extends PropertyWidget {
  TDPropertyTextField(TDProperty property) : super(property);

  @override
  State<StatefulWidget> createState() => TDPropertyTextFieldState();
}

class TDPropertyTextFieldState extends PropertyWidgetState {
  @override
  Widget build(BuildContext cvontext) {
    return BlocProvider(
        builder: (BuildContext context) => bloc,
        child: BlocListener(
          bloc: bloc,
          // Listener is the place for logging, showing Snackbars, navigating, etc.
          // It is guaranteed to run only once per state change.
          listener: (BuildContext context, TDPropertyState state) {
            if (state is TDPropertyEdition) {
              _textController.text = shownValue;
            }
          },
          // BlocBuilder invokes the builder when new state is emitted.
          child: BlocBuilder(
            bloc: bloc,
            // The builder function has to be a "pure function".
            // That is, it only returns a Widget and doesn't do anything else.
            builder: (BuildContext context, TDPropertyState state) {
              // Changing the UI based on the current state
              if (state is TDPropertyExhibition) {
                return buildExhibition();
              } else if (state is TDPropertyEdition) {
                return buildEditing(false);
              } else if (state is TDPropertyLoadingSubmit) {
                return buildEditing(true);
              } else if (state is TDPropertySubmitSuccess) {
                finishEdition();
                return buildExhibition();
              } else if (state is TDPropertySubmitFail) {
                cancelEdition();
                return buildExhibition();
              } else {
                return null;
              }
            },
          ),
        ));
  }

  buildExhibition() {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.property.name,
            style: Theme.of(context).textTheme.title,
          ),
          shownValue != null ? Text(shownValue) : Text(widget.property.value),
          // )
        ],
      )),
      InkWell(
        onTap: editProperty,
        child: Icon(
          Icons.edit,
          color: Theme.of(context).accentColor,
        ),
      )
    ]);
  }

  final _textController = TextEditingController();
  buildEditing(bool loading) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!loading)
            InkWell(
              onTap: cancelEdition,
              child: Icon(
                Icons.clear,
                color: Colors.red,
              ),
            ),
          if (!loading) SizedBox(width: 8),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(widget.property.name,
                    style: Theme.of(context).textTheme.title),
                TextField(
                  enabled: !loading,
                  controller: _textController,
                  keyboardType: TextInputType.number,
                  maxLines: null,
                  onChanged: (newString) => editingValue = newString,
                  onSubmitted: (finalString) => submitEdition(),
                  textInputAction: TextInputAction.send,
                  decoration: InputDecoration(
                    hintText: "New text value",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                )
              ])),
          SizedBox(width: 8),
          loading
              ? CircularProgressIndicator(
                  value: null,
                  strokeWidth: 2,
                )
              : InkWell(
                  onTap: submitEdition,
                  child: Icon(Icons.check, color: Colors.green),
                )
        ]);
  }

  textFieldSubmit(String text) {
    editingValue = text;
    submitEdition();
  }

  buildLoading() {
    return Text("Loading");
  }

  buildAlert(String message) {
    return AlertDialog(
      title: Text("Alerta"),
      content: Text(message),
      actions: <Widget>[
        FlatButton(onPressed: finishEdition, child: Text("OK"))
      ],
    );
  }
}
