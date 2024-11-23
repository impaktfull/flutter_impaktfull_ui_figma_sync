import 'package:impaktfull_ui_figma_sync/src/model/figma/file/file_response.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/node/node.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/node/node_type.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/node/node_with_children.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/node/text_node.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma_config.dart';
import 'package:impaktfull_ui_figma_sync/src/model/theme/components/color.dart';
import 'package:impaktfull_ui_figma_sync/src/model/theme/components/component_text_style.dart';
import 'package:impaktfull_ui_figma_sync/src/model/theme/components/text_style.dart';
import 'package:impaktfull_ui_figma_sync/src/model/theme/components/text_style_group.dart';
import 'package:impaktfull_ui_figma_sync/src/parser/color_parser.dart';
import 'package:impaktfull_ui_figma_sync/src/service/figma_service.dart';
import 'package:impaktfull_ui_figma_sync/src/util/extension/list_extension.dart';

class TextStyleParser {
  const TextStyleParser._();

  static Future<List<ImpaktfullUiFigmaTextStyleGroup>> getTextStyles(
    FigmaConfig figmaConfig,
    FigmaService figmaService,
    FigmaFileResponse file,
  ) async {
    final styleIds = file.styles.keys;
    final nodeResponse =
        await figmaService.getNodes(figmaConfig.figmaFileKey, styleIds);
    final textStyles = nodeResponse.nodes.entries
        .map((entry) {
          final id = entry.key;
          final node = entry.value.document;
          if (node.type != NodeType.text) return null;
          return TextStyleParser.parseTextStyle(
            id: id,
            node: node,
          );
        })
        .nonNulls
        .toList();
    final groups = <String, List<ImpaktfullUiFigmaTextStyle>>{};
    for (final style in textStyles) {
      if (groups.containsKey(style.groupName)) {
        groups[style.groupName]!.add(style);
      } else {
        groups[style.groupName] = [style];
      }
    }

    return groups.entries
        .map(
          (entry) => ImpaktfullUiFigmaTextStyleGroup(
            name: entry.key,
            textStyles: entry.value,
          ),
        )
        .toList();
  }

  static ImpaktfullUiFigmaComponentTextStyle parseComponentTextStyle(
    FigmaNode node,
    List<ImpaktfullUiFigmaTextStyle> textStyles,
    List<ImpaktfullUiFigmaColor> colors,
  ) {
    if (node is! FigmaNodeWithChildren) {
      throw Exception('Node with children expected: Found ${node.runtimeType}');
    }
    final labelText = node.children[0]; // text
    if (labelText is! FigmaTextNode) {
      throw Exception('Text node expected: Found ${node.runtimeType}');
    }
    final textStyle = parseTextStyle(
      id: labelText.id,
      node: labelText,
      textStyles: textStyles,
    );
    return ImpaktfullUiFigmaComponentTextStyle(
      name: labelText.characters,
      textStyle: textStyle,
      color: ColorParser.parseColorByid(
        labelText.characters,
        labelText,
        colors,
      ),
    );
  }

  static ImpaktfullUiFigmaTextStyle parseTextStyle({
    required String id,
    required FigmaNode node,
    List<ImpaktfullUiFigmaTextStyle>? textStyles,
  }) {
    if (node is! FigmaTextNode) {
      throw Exception('Text node expected: Found ${node.runtimeType}');
    }
    if (node.styles?.text != null && textStyles != null) {
      final style =
          textStyles.firstWhereOrNull((e) => e.id == node.styles!.text);
      if (style != null) {
        return style;
      }
    }
    final style = node.style;
    if (style == null) {
      throw Exception('Text style expected: Found ${node.runtimeType}');
    }
    return ImpaktfullUiFigmaTextStyle(
      id: id,
      name: node.name,
      fontFamily: style.fontFamily,
      fontWeight: style.fontWeight,
      fontSize: style.fontSize,
    );
  }
}
