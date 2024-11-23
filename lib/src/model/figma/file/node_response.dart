import 'package:impaktfull_ui_figma_sync/src/model/figma/node/node.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/node/node_with_children.dart';

class FigmaNodeResponse {
  final FigmaNode document;

  FigmaNodeResponse({
    required this.document,
  });

  factory FigmaNodeResponse.fromJson(Map<String, dynamic> json) {
    return FigmaNodeResponse(
      document: FigmaNodeWithChildren.parseChild(json['document'] as Map<String, dynamic>)!,
    );
  }
}
