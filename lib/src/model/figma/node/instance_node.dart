import 'package:impaktfull_ui_figma_sync/src/model/figma/node/node.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/node/node_with_children.dart';

class InstanceFrameNode extends FigmaNodeWithChildren {
  const InstanceFrameNode({
    required super.id,
    required super.name,
    required super.type,
    required super.children,
  });

  static InstanceFrameNode fromJson(Map<String, dynamic> json) =>
      InstanceFrameNode(
        id: FigmaNode.parseId(json),
        name: FigmaNode.parseName(json),
        type: FigmaNode.parseType(json),
        children: FigmaNodeWithChildren.parseChildren(json) ?? [],
      );
}
