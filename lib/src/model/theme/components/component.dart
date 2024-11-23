import 'package:impaktfull_ui_figma_sync/src/model/theme/components/color.dart';
import 'package:impaktfull_ui_figma_sync/src/model/theme/components/component_text_style.dart';

class ImpaktfullUiFigmaComponent {
  final String name;
  final List<ImpaktfullUiFigmaColor> colors;
  final List<ImpaktfullUiFigmaComponentTextStyle> textStyles;

  const ImpaktfullUiFigmaComponent({
    required this.name,
    required this.colors,
    required this.textStyles,
  });
}
