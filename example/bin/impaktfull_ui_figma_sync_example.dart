import 'package:impaktfull_ui_figma_sync/impaktfull_ui_figma_sync.dart';

Future<void> main(List<String> arguments) async {
  final theme = await ImpaktfullUiFigmaSync().sync();
  for (final color in theme.colors) {
    print(' - ${color.name}: ${color.color.toHex()}: ${color.variableId}');
  }
}
