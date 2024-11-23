import 'package:impaktfull_ui_figma_sync/impaktfull_ui_figma_sync.dart';

Future<void> main(List<String> arguments) async {
  final theme = await ImpaktfullUiFigmaSync().sync();
  print('Colors:');
  for (final color in theme.colors) {
    print(' - ${color.name}: ${color.color.toHex()}: ${color.variableId}');
  }

  print('Text styles:');
  for (final textStyle in theme.textStyles) {
    print(' - ${textStyle.name}');
    for (final style in textStyle.textStyles) {
      print('   - ${style.styleName}');
    }
  }

  print('Components:');
  for (final component in theme.components) {
    print(' - ${component.name}');
    print('   colors:');
    for (final color in component.colors) {
      print('   - ${color.name}: ${color.color.toHex()}: ${color.variableId}');
    }
    print('   text styles:');
    for (final textStyle in component.textStyles) {
      print('   - ${textStyle.name}: ${textStyle.textStyle?.name} - ${textStyle.color?.color.toHex()}');
    }
  }
}
