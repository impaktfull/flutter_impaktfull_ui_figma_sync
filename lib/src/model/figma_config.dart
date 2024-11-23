import 'dart:io';

import 'package:impaktfull_ui_figma_sync/src/util/logger/logger.dart';
import 'package:yaml/yaml.dart';

class FigmaConfig {
  final String figmaFileKey;
  final String personalAccessToken;
  final LogLevel logLevel;

  FigmaConfig({
    required this.figmaFileKey,
    required this.personalAccessToken,
    this.logLevel = LogLevel.normal,
  });

  static FigmaConfig? parseFromArgs(List<String> args) {
    if (args.isEmpty) return null;
    try {
      return FigmaConfig(
        figmaFileKey: args[0],
        personalAccessToken: args[1],
        logLevel:
            args.contains('--verbose') ? LogLevel.verbose : LogLevel.normal,
      );
    } catch (e) {
      FigmaSyncLogger.log('Error parsing figma config from args: $e');
      return null;
    }
  }

  static FigmaConfig envs() {
    final pubspecFile = File('pubspec.yaml');
    final hasPubspec = pubspecFile.existsSync();
    if (!hasPubspec) {
      throw Exception('No pubspec.yaml found');
    }

    final pubspec = pubspecFile.readAsStringSync();
    final yaml = loadYaml(pubspec);
    final figmaSyncConfig = yaml['impaktfull_ui_figma_sync'];
    if (figmaSyncConfig == null) {}

    final figmaFileKey = _getValue(
      figmaSyncConfig,
      'figma_file_key',
      envKey: 'IF_UI_FIGMA_SYNC_FILE_KEY',
    );
    if (figmaFileKey == null) {
      throw Exception('`figma_file_key` not found');
    }
    final personalAccessToken = _getValue(
      figmaSyncConfig,
      'figma_file_key',
      envKey: 'IF_UI_FIGMA_SYNC_PAT',
    );
    if (personalAccessToken == null) {
      throw Exception('`personal_access_token` not found');
    }
    return FigmaConfig(
      figmaFileKey: figmaFileKey,
      personalAccessToken: personalAccessToken,
      logLevel: _getValue(figmaSyncConfig, 'log_level') == 'verbose'
          ? LogLevel.verbose
          : LogLevel.normal,
    );
  }

  static String? _getValue(
    dynamic yaml,
    String key, {
    String? envKey,
  }) {
    if (yaml != null) {
      final pubspecValue = yaml[key] as String?;
      if (pubspecValue != null && pubspecValue.isNotEmpty) {
        return pubspecValue;
      }
    }
    if (envKey == null) return null;
    FigmaSyncLogger.log(
        'Key `$key`` not found in pubspec.yaml (checking environment variables `$envKey`)');
    final value = Platform.environment[envKey];
    if (value == null || value.isEmpty) {
      return null;
    }
    return value;
  }
}
