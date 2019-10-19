
import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

@JsonSerializable(explicitToJson: true)
class TDProperty {  
  bool enumerable = false;
  String name;
  dynamic value;
}