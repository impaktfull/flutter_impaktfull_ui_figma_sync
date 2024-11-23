import 'package:impaktfull_ui_figma_sync/src/model/figma/node/node_type.dart';

abstract class FigmaNode {
  final String id;
  final String name;

  /// Type of the node
  /// if it is null this means that we have not yet implemented this node type, but we can still parse the children
  final NodeType? type;

  const FigmaNode({
    required this.id,
    required this.name,
    required this.type,
  });

  static String parseId(Map<String, dynamic> json) => json['id'] as String;

  static String parseName(Map<String, dynamic> json) => json['name'] as String;

  static NodeType? parseType(Map<String, dynamic> json) =>
      NodeType.fromString(json['type'] as String);
}
