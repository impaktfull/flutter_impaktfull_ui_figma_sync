import 'package:impaktfull_ui_figma_sync/src/model/figma/node/node.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/supporting/color.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/supporting/fill.dart';

abstract class FigmaVectorNode extends FigmaNode {
  final List<FigmaFill> fills;
  final FigmaColor? backgroundColor;
  const FigmaVectorNode({
    required super.id,
    required super.name,
    required super.type,
    required this.fills,
    required this.backgroundColor,
  });

  static List<FigmaFill> parseFills(Map<String, dynamic> json) =>
      (json['fills'] as List<dynamic>).map((e) => FigmaFill.fromJson(e as Map<String, dynamic>)).toList();

  static FigmaColor? parseBackgroundColor(Map<String, dynamic> json) =>
      FigmaColor.fromJsonOptional(json['backgroundColor'] as Map<String, dynamic>?);
}
