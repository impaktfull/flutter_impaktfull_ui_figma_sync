import 'package:impaktfull_ui_figma_sync/src/model/figma/node/node.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/node/node_with_children.dart';

class FigmaCanvasNode extends FigmaNodeWithChildren {
  final String? variableMode;

  const FigmaCanvasNode({
    required super.id,
    required super.name,
    required super.type,
    required this.variableMode,
    required super.children,
  });

  static FigmaCanvasNode fromJson(Map<String, dynamic> json) => FigmaCanvasNode(
        id: FigmaNode.parseId(json),
        name: FigmaNode.parseName(json),
        type: FigmaNode.parseType(json),
        variableMode: json['variable_mode'] as String?,
        children: FigmaNodeWithChildren.parseChildren(json) ?? [],
      );
}
