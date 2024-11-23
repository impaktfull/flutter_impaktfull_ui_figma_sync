import 'package:impaktfull_ui_figma_sync/src/model/figma/node/node.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/node/node_with_children.dart';

class FigmaDocumentNode extends FigmaNodeWithChildren {
  const FigmaDocumentNode({
    required super.id,
    required super.name,
    required super.type,
    required super.children,
  });

  static FigmaDocumentNode fromJson(Map<String, dynamic> json) =>
      FigmaDocumentNode(
        id: FigmaNode.parseId(json),
        name: FigmaNode.parseName(json),
        type: FigmaNode.parseType(json),
        children: FigmaNodeWithChildren.parseChildren(json) ?? [],
      );
}
