import 'package:impaktfull_ui_figma_sync/src/model/figma/file/file_response.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/node/node.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/node/node_with_children.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/node/rectangle_node.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/node/text_node.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/node/vector_node.dart';
import 'package:impaktfull_ui_figma_sync/src/model/theme/components/color.dart';
import 'package:impaktfull_ui_figma_sync/src/parser/figma_sync_parser.dart';
import 'package:impaktfull_ui_figma_sync/src/parser/parse_type.dart';
import 'package:impaktfull_ui_figma_sync/src/util/extension/list_extension.dart';

class ColorParser {
  const ColorParser._();
  static List<ImpaktfullUiFigmaColor> parse({
    required FigmaFileResponse file,
    String? themeName,
  }) {
    final colorsFrame = FigmaSyncParser.getFigmaSyncFrame(
      file,
      parseType: ParseType.colors,
    );
    return colorsFrame.children.map((e) => parseComponentColor(e)).toList();
  }

  /// Parses a color node.
  ///
  /// Figma component should look like this:
  ///
  /// ```
  /// Frame
  ///   Rectangle[only 1 fill]
  ///   Text
  /// ```
  static ImpaktfullUiFigmaColor parseComponentColor(FigmaNode node) {
    if (node is! FigmaNodeWithChildren) {
      throw Exception('Node with children expected: Found ${node.runtimeType}');
    }
    final colorRectangle = node.children[0]; // color rect
    final labelText = node.children[1]; // label text
    if (colorRectangle is! FigmaRectangleNode) {
      throw Exception('Rectangle node expected: Found ${colorRectangle.runtimeType}');
    }
    if (labelText is! FigmaTextNode) {
      throw Exception('Text node expected: Found ${labelText.runtimeType}');
    }
    final fills = colorRectangle.fills;
    if (fills.isEmpty) {
      throw Exception('Fills can not be empty');
    } else if (fills.length > 1) {
      throw Exception('Only one fill is allowed');
    }
    final figmaColor = colorRectangle.fills.first;
    final color = figmaColor.color;
    if (color == null) {
      throw Exception('Color can not be null');
    }
    final variableId = figmaColor.boundVariables?.color.id;
    return ImpaktfullUiFigmaColor(
      name: labelText.characters,
      color: color,
      variableId: variableId,
    );
  }

  static ImpaktfullUiFigmaColor? parseColorByid(
    String name,
    FigmaNode node,
    List<ImpaktfullUiFigmaColor> colors,
  ) {
    if (node is! FigmaVectorNode) {
      throw Exception('FigmaVectorNode expected: Found ${node.runtimeType}');
    }
    final fills = node.fills;
    if (fills.isEmpty) {
      throw Exception('Fills can not be empty');
    } else if (fills.length > 1) {
      throw Exception('Only one fill is allowed');
    }
    final figmaColor = node.fills.first;
    final normalizedVariableId = figmaColor.boundVariables?.color.normalizedId;
    final variableColor = colors.firstWhereOrNull((e) => e.variableId == normalizedVariableId);
    if (variableColor != null) {
      return variableColor;
    }
    final variableId = figmaColor.boundVariables?.color.id;
    final color = figmaColor.color;
    if (color == null) {
      throw Exception('Color can not be null');
    }
    return ImpaktfullUiFigmaColor(
      name: name,
      color: color,
      variableId: variableId,
    );
  }
}
