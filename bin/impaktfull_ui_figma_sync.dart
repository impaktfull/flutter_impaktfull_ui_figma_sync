import 'package:impaktfull_ui_figma_sync/impaktfull_ui_figma_sync.dart';

void main(List<String> arguments) => ImpaktfullUiFigmaSync().sync(
      config: FigmaConfig.parseFromArgs(arguments),
    );
