import 'package:impaktfull_ui_figma_sync/src/model/figma/supporting/bound_variable.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/supporting/color.dart';
import 'package:impaktfull_ui_figma_sync/src/util/extension/list_extension.dart';

class FigmaFill {
  final FigmaBlendMode blendMode;
  final FigmaFillType type;
  final FigmaColor? color;
  final FigmaBoundVariable? boundVariables;

  FigmaFill({
    required this.blendMode,
    required this.type,
    required this.color,
    required this.boundVariables,
  });

  static FigmaFill fromJson(Map<String, dynamic> json) => FigmaFill(
        blendMode: FigmaBlendMode.fromJson(json['blendMode'] as String),
        type: FigmaFillType.fromJson(json['type'] as String),
        color:
            FigmaColor.fromJsonOptional(json['color'] as Map<String, dynamic>?),
        boundVariables: FigmaBoundVariable.fromJsonOptional(
            json['boundVariables'] as Map<String, dynamic>?),
      );
}

enum FigmaFillType {
  solid('SOLID'),
  image('IMAGE');

  final String value;

  const FigmaFillType(this.value);

  static FigmaFillType fromJson(String json) {
    final fillType =
        FigmaFillType.values.firstWhereOrNull((e) => e.value == json);
    if (fillType == null) {
      throw Exception('Invalid fill type: $json');
    }
    return fillType;
  }
}

enum FigmaBlendMode {
  normal('NORMAL');

  final String value;

  const FigmaBlendMode(this.value);

  static FigmaBlendMode fromJson(String json) {
    final blendMode =
        FigmaBlendMode.values.firstWhereOrNull((e) => e.value == json);
    if (blendMode == null) {
      throw Exception('Invalid blend mode: $json');
    }
    return blendMode;
  }
}
