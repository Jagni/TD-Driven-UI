import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td_driven_ui/default_widgets/form/index.dart';
import 'package:td_driven_ui/thing_ui_models/thing_ui_models.dart';

void main() {
  final form = TdUiForm();

  final titleInput = TdUiTextInput(TdUiTextInputType.multiline);
  titleInput.label = "Título do alarme";
  form.inputs["name"] = titleInput;

  final emailInput = TdUiTextInput(TdUiTextInputType.email);
  emailInput.label = "Email";
  form.inputs["email"] = emailInput;

  final dateInput = TdUiTextInput(TdUiTextInputType.datetime);
  dateInput.label = "Data do alarme";
  form.inputs["date"] = dateInput;

  final stepperInput = TdUiNumberInput(NumberInputType.stepper);
  stepperInput.label = "Numero";
  stepperInput.min = 0;
  stepperInput.max = 10;
  form.inputs["stepper"] = stepperInput;

  runApp(Provider.value(value: form, child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(body: TdUiFormWidget()),
    );
  }
}
