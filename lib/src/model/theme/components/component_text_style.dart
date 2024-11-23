import 'package:impaktfull_ui_figma_sync/src/model/theme/components/color.dart';
import 'package:impaktfull_ui_figma_sync/src/model/theme/components/text_style.dart';

class ImpaktfullUiFigmaComponentTextStyle {
  final String name;
  final ImpaktfullUiFigmaColor? color;
  final ImpaktfullUiFigmaTextStyle? textStyle;

  const ImpaktfullUiFigmaComponentTextStyle({
    required this.name,
    required this.color,
    required this.textStyle,
  });
}
