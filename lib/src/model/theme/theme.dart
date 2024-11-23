import 'package:impaktfull_ui_figma_sync/src/model/theme/components/color.dart';
import 'package:impaktfull_ui_figma_sync/src/model/theme/components/component.dart';
import 'package:impaktfull_ui_figma_sync/src/model/theme/components/text_style_group.dart';

class ImpaktfullUiFigmaTheme {
  final String name;
  final String key;
  final List<ImpaktfullUiFigmaColor> colors;
  final List<ImpaktfullUiFigmaTextStyleGroup> textStyles;
  final List<ImpaktfullUiFigmaComponent> components;

  const ImpaktfullUiFigmaTheme({
    required this.name,
    required this.key,
    required this.colors,
    required this.textStyles,
    required this.components,
  });
}
