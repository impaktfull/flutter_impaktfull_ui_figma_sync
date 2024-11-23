import 'package:impaktfull_ui_figma_sync/src/model/figma/node/node.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/node/vector_node.dart';

class FigmaTextNode extends FigmaVectorNode {
  final String characters;
  final FigmaTextStyle? style;
  final FigmaTextStyles? styles;
  const FigmaTextNode({
    required super.id,
    required super.name,
    required super.type,
    required super.fills,
    required super.backgroundColor,
    required this.characters,
    required this.style,
    required this.styles,
  });

  static FigmaTextNode fromJson(Map<String, dynamic> json) => FigmaTextNode(
        id: FigmaNode.parseId(json),
        name: FigmaNode.parseName(json),
        type: FigmaNode.parseType(json),
        fills: FigmaVectorNode.parseFills(json),
        backgroundColor: FigmaVectorNode.parseBackgroundColor(json),
        characters: json['characters'] as String,
        style: FigmaTextStyle.fromJsonOptional(json['style'] as Map<String, dynamic>?),
        styles: FigmaTextStyles.fromJsonOptional(json['styles'] as Map<String, dynamic>?),
      );
}

class FigmaTextStyle {
  final String fontFamily;
  final int fontWeight;
  final double fontSize;

  FigmaTextStyle({
    required this.fontFamily,
    required this.fontWeight,
    required this.fontSize,
  });

  static FigmaTextStyle? fromJsonOptional(Map<String, dynamic>? json) {
    if (json == null) return null;
    return fromJson(json);
  }

  static FigmaTextStyle fromJson(Map<String, dynamic> json) => FigmaTextStyle(
        fontFamily: json['fontFamily'] as String,
        fontWeight: json['fontWeight'] as int,
        fontSize: json['fontSize'] as double,
      );
}

class FigmaTextStyles {
  final String? text;

  FigmaTextStyles({
    required this.text,
  });

  static FigmaTextStyles? fromJsonOptional(Map<String, dynamic>? json) {
    if (json == null) return null;
    return fromJson(json);
  }

  static FigmaTextStyles fromJson(Map<String, dynamic> json) => FigmaTextStyles(
        text: json['text'] as String?,
      );
}
