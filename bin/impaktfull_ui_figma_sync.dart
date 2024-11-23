import 'package:impaktfull_ui_figma_sync/impaktfull_ui_figma_sync.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma_config.dart';

void main(List<String> arguments) => ImpaktfullUiFigmaSync().sync(
      config: FigmaConfig.parseFromArgs(arguments),
    );
