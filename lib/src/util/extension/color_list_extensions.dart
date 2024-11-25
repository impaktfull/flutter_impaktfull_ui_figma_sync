import 'package:impaktfull_ui_figma_sync/impaktfull_ui_figma_sync.dart';
import 'package:impaktfull_ui_figma_sync/src/util/extension/list_extension.dart';

extension ImpaktfullUiFigmaColorListExtensions on List<ImpaktfullUiFigmaColor> {
  ImpaktfullUiFigmaColor get(String name) {
    final color = getOptional(name);
    if (color == null) {
      throw Exception('Color with name $name not found');
    }
    return color;
  }

  ImpaktfullUiFigmaColor? getOptional(String name) =>
      firstWhereOrNull((e) => e.name == name);
}
