import 'package:impaktfull_ui_figma_sync/impaktfull_ui_figma_sync.dart';
import 'package:impaktfull_ui_figma_sync/src/util/extension/list_extension.dart';

extension ImpaktfullUiFigmaTextStyleListExtensions on List<ImpaktfullUiFigmaTextStyle> {
  ImpaktfullUiFigmaTextStyle get(String name) {
    final color = getOptional(name);
    if (color == null) {
      throw Exception('TextStyle with name $name not found');
    }
    return color;
  }

  ImpaktfullUiFigmaTextStyle? getOptional(String name) => firstWhereOrNull((e) => e.name == name);
}
