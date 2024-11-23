import 'package:impaktfull_ui_figma_sync/src/model/figma/node/canvas_node.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/node/document_node.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/node/frame_node.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/node/instance_node.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/node/node.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/node/node_type.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/node/rectangle_node.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/node/text_node.dart';
import 'package:impaktfull_ui_figma_sync/src/util/extension/list_extension.dart';

abstract class FigmaNodeWithChildren extends FigmaNode {
  final List<FigmaNode> children;
  const FigmaNodeWithChildren({
    required super.id,
    required super.name,
    required super.type,
    required this.children,
  });

  static List<FigmaNode>? parseChildren(Map<String, dynamic> json) {
    final children = json['children'] as List<dynamic>?;
    if (children == null) return null;
    return children.map((child) => parseChild(child as Map<String, dynamic>)).nonNulls.toList();
  }

  static FigmaNode? parseChild(Map<String, dynamic> json) {
    final type = NodeType.fromString(json['type'] as String);
    if (type == null) return null;
    switch (type) {
      case NodeType.document:
        return FigmaDocumentNode.fromJson(json);
      case NodeType.canvas:
        return FigmaCanvasNode.fromJson(json);
      case NodeType.frame:
        return FigmaFrameNode.fromJson(json);
      case NodeType.rectangle:
        return FigmaRectangleNode.fromJson(json);
      case NodeType.text:
        return FigmaTextNode.fromJson(json);
      case NodeType.instance:
        return InstanceFrameNode.fromJson(json);
    }
  }

  FigmaNode getChild(String name) {
    final child = getOptionalChild(name);
    if (child == null) throw Exception('Child with name `$name` not found');
    return child;
  }

  FigmaNode? getOptionalChild(String name) {
    if (children.isEmpty) return null;
    return children.firstWhereOrNull((e) => e.name.toLowerCase() == name.toLowerCase());
  }

  FigmaNodeWithChildren getChildWithChildren(String name) {
    final child = getOptionalChildWithChildren(name);
    if (child == null) throw Exception('Child with name `$name` not found');
    return child;
  }

  FigmaNodeWithChildren? getOptionalChildWithChildren(String name) {
    if (children.isEmpty) return null;
    final child = children.firstWhereOrNull((e) => e.name.toLowerCase() == name.toLowerCase());
    if (child == null) return null;
    if (child is! FigmaNodeWithChildren) {
      throw Exception('Child with name `$name` is not a node with children: ${child.runtimeType}');
    }
    return child;
  }
}
