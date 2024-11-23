import 'package:impaktfull_ui_figma_sync/src/util/logger/logger.dart';

enum NodeType {
  document(value: 'DOCUMENT'),
  canvas(value: 'CANVAS'),
  frame(value: 'FRAME'),
  rectangle(value: 'RECTANGLE'),
  text(value: 'TEXT'),
  instance(value: 'INSTANCE');

  final String value;

  const NodeType({
    required this.value,
  });

  static NodeType? fromString(String value) {
    for (final type in NodeType.values) {
      if (type.value == value) {
        return type;
      }
    }
    FigmaSyncLogger.verbose('Unknown node type: $value');
    return null;
  }
}
