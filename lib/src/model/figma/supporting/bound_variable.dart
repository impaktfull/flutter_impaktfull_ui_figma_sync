import 'package:impaktfull_ui_figma_sync/src/model/figma/supporting/variable_alias.dart';

class FigmaBoundVariable {
  final FigmaVariableAlias color;

  const FigmaBoundVariable({
    required this.color,
  });

  static FigmaBoundVariable? fromJsonOptional(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return FigmaBoundVariable.fromJson(json);
  }

  static FigmaBoundVariable fromJson(Map<String, dynamic> json) =>
      FigmaBoundVariable(
        color:
            FigmaVariableAlias.fromJson(json['color'] as Map<String, dynamic>),
      );
}
