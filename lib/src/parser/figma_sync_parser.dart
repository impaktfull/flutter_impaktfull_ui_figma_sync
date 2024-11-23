import 'package:impaktfull_ui_figma_sync/src/model/figma/file/file_response.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/node/canvas_node.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/node/frame_node.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/node/node.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/node/node_with_children.dart';
import 'package:impaktfull_ui_figma_sync/src/parser/parse_type.dart';
import 'package:impaktfull_ui_figma_sync/src/util/extension/list_extension.dart';

class FigmaSyncParser {
  FigmaSyncParser._();

  static bool isFigmaSyncComponentFrame(FigmaNode node) {
    if (node is! FigmaNodeWithChildren) return false;
    final requiredFrames = [
      'assets',
      'colors',
      'dimens',
      'textstyles',
      'shadows',
    ];
    final availableFrames = <String>{};
    for (final child in node.children) {
      if (child is! FigmaNodeWithChildren) continue;
      availableFrames.add(child.name.toLowerCase());
    }
    final hasAllRequiredFrames =
        requiredFrames.every((frame) => availableFrames.contains(frame));
    if (hasAllRequiredFrames) return true;
    print(
        'Missing frames for `${node.name}`: ${requiredFrames.where((frame) => !availableFrames.contains(frame))}');
    return false;
  }

  static FigmaNodeWithChildren getFigmaSyncFrame(
    FigmaFileResponse file, {
    ParseType? parseType,
    String? themeName,
  }) {
    final figmaSyncKeys = [
      'figma_sync',
      'figma sync',
      'impaktfull ui figma sync',
      'impaktfull figma sync',
    ];
    final figmaSyncCanvas = file.documents.children.firstWhereOrNull(
      (element) => figmaSyncKeys.any((key) {
        final name = element.name.toLowerCase();
        if (themeName != null) {
          return name.endsWith('$themeName $key');
        }
        return name.endsWith(key);
      }),
    );
    if (figmaSyncCanvas == null) {
      throw Exception('No figma sync canvas node found');
    }
    if (figmaSyncCanvas is! FigmaCanvasNode) {
      throw Exception('Canvas node expected');
    }
    if (parseType != null) {
      final frame = figmaSyncCanvas.getChildWithChildren(parseType.value);
      if (frame is! FigmaFrameNode) {
        throw Exception('Frame node expected: Found ${frame.runtimeType}');
      }
      return frame;
    }
    return figmaSyncCanvas;
  }
}
