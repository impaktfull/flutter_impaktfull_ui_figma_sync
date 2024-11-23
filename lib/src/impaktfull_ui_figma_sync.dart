import 'package:impaktfull_ui_figma_sync/src/model/figma_config.dart';
import 'package:impaktfull_ui_figma_sync/src/model/theme/theme.dart';
import 'package:impaktfull_ui_figma_sync/src/parser/color_parser.dart';
import 'package:impaktfull_ui_figma_sync/src/parser/component_parser.dart';
import 'package:impaktfull_ui_figma_sync/src/parser/text_style_parser.dart';
import 'package:impaktfull_ui_figma_sync/src/service/figma_api.dart';
import 'package:impaktfull_ui_figma_sync/src/service/figma_service.dart';
import 'package:impaktfull_ui_figma_sync/src/util/logger/logger.dart';

class ImpaktfullUiFigmaSync {
  ImpaktfullUiFigmaSync();

  Future<ImpaktfullUiFigmaTheme> sync({
    FigmaConfig? config,
    String? themeName,
    LogLevel logLevel = LogLevel.normal,
  }) async {
    FigmaSyncLogger.setLogLevel(logLevel);
    final figmaConfig = config ?? FigmaConfig.envs();
    final figmaApi = FigmaApi(config: figmaConfig);
    final figmaService = FigmaService(api: figmaApi);
    final file = await figmaService.getFile(figmaConfig.figmaFileKey);

    // Base theme
    final allColors = ColorParser.parse(file: file, themeName: themeName);
    final textStyles =
        await TextStyleParser.getTextStyles(figmaConfig, figmaService, file);
    final allTextStyles = textStyles.expand((e) => e.textStyles).toList();

    return ImpaktfullUiFigmaTheme(
      name: file.name,
      key: figmaConfig.figmaFileKey,
      colors: allColors,
      textStyles: textStyles,
      components: ComponentParser.parse(
        file,
        allTextStyles,
        allColors,
      ),
    );
  }
}
