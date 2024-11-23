import 'package:impaktfull_ui_figma_sync/src/model/figma/node/node.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/node/node_with_children.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/supporting/color.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/supporting/fill.dart';

class FigmaFrameNode extends FigmaNodeWithChildren {
  final List<FigmaFill> fills;
  final FigmaColor backgroundColor;
  const FigmaFrameNode({
    required super.id,
    required super.name,
    required super.type,
    required super.children,
    required this.fills,
    required this.backgroundColor,
  });

  static FigmaFrameNode fromJson(Map<String, dynamic> json) => FigmaFrameNode(
        id: FigmaNode.parseId(json),
        name: FigmaNode.parseName(json),
        type: FigmaNode.parseType(json),
        children: FigmaNodeWithChildren.parseChildren(json) ?? [],
        fills: (json['fills'] as List<dynamic>).map((e) => FigmaFill.fromJson(e as Map<String, dynamic>)).toList(),
        backgroundColor: FigmaColor.fromJson(json['backgroundColor'] as Map<String, dynamic>),
      );
}
