import 'package:impaktfull_ui_figma_sync/src/model/figma/node/node.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/node/vector_node.dart';

class FigmaRectangleNode extends FigmaVectorNode {
  const FigmaRectangleNode({
    required super.id,
    required super.name,
    required super.type,
    required super.fills,
    required super.backgroundColor,
  });

  static FigmaRectangleNode fromJson(Map<String, dynamic> json) => FigmaRectangleNode(
        id: FigmaNode.parseId(json),
        name: FigmaNode.parseName(json),
        type: FigmaNode.parseType(json),
        fills: FigmaVectorNode.parseFills(json),
        backgroundColor: FigmaVectorNode.parseBackgroundColor(json),
      );
}
