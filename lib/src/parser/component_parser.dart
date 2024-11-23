import 'package:impaktfull_ui_figma_sync/src/model/figma/file/file_response.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/node/node.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/node/node_with_children.dart';
import 'package:impaktfull_ui_figma_sync/src/model/theme/components/color.dart';
import 'package:impaktfull_ui_figma_sync/src/model/theme/components/component.dart';
import 'package:impaktfull_ui_figma_sync/src/model/theme/components/component_text_style.dart';
import 'package:impaktfull_ui_figma_sync/src/model/theme/components/text_style.dart';
import 'package:impaktfull_ui_figma_sync/src/parser/color_parser.dart';
import 'package:impaktfull_ui_figma_sync/src/parser/figma_sync_parser.dart';
import 'package:impaktfull_ui_figma_sync/src/parser/text_style_parser.dart';

class ComponentParser {
  static const _figmaSyncKey = 'figma_sync';
  ComponentParser._();

  static List<ImpaktfullUiFigmaComponent> parse(
    FigmaFileResponse file,
    List<ImpaktfullUiFigmaTextStyle> textStyles,
    List<ImpaktfullUiFigmaColor> colors,
  ) {
    final list = <ImpaktfullUiFigmaComponent>[];
    for (final document in file.documents.children) {
      if (document is! FigmaNodeWithChildren) continue;
      final components = parsePage(document, textStyles, colors);
      if (components.isEmpty) continue;
      list.addAll(components);
    }
    return list;
  }

  static List<ImpaktfullUiFigmaComponent> parsePage(
    FigmaNodeWithChildren document,
    List<ImpaktfullUiFigmaTextStyle> textStyles,
    List<ImpaktfullUiFigmaColor> colors,
  ) {
    final components = document.children.where((e) {
      if (e is! FigmaNodeWithChildren) return false;
      return e.children
          .any((element) => element.name.toLowerCase() == _figmaSyncKey);
    });
    if (components.isEmpty) return [];
    return components
        .map((e) => parseComponent(
              e,
              textStyles,
              colors,
            ))
        .nonNulls
        .toList();
  }

  static ImpaktfullUiFigmaComponent? parseComponent(
    FigmaNode node,
    List<ImpaktfullUiFigmaTextStyle> textStyles,
    List<ImpaktfullUiFigmaColor> colors,
  ) {
    if (node is! FigmaNodeWithChildren) return null;
    final figmaSyncFrame = node.getOptionalChildWithChildren(_figmaSyncKey);
    if (figmaSyncFrame == null) return null;
    if (!FigmaSyncParser.isFigmaSyncComponentFrame(figmaSyncFrame)) return null;
    return ImpaktfullUiFigmaComponent(
      name: node.name,
      colors: parseColors(figmaSyncFrame
          .getChildWithChildren('colors')
          .getChildWithChildren('items')),
      textStyles: parseTextStyles(
        figmaSyncFrame
            .getChildWithChildren('textStyles')
            .getChildWithChildren('items'),
        textStyles,
        colors,
      ),
    );
  }

  static List<ImpaktfullUiFigmaColor> parseColors(FigmaNode node) {
    if (node is! FigmaNodeWithChildren) return [];
    return node.children
        .map((child) => ColorParser.parseComponentColor(child))
        .nonNulls
        .toList();
  }

  static List<ImpaktfullUiFigmaComponentTextStyle> parseTextStyles(
    FigmaNode node,
    List<ImpaktfullUiFigmaTextStyle> textStyles,
    List<ImpaktfullUiFigmaColor> colors,
  ) {
    if (node is! FigmaNodeWithChildren) return [];
    return node.children
        .map((child) => TextStyleParser.parseComponentTextStyle(
              child,
              textStyles,
              colors,
            ))
        .nonNulls
        .toList();
  }
}
