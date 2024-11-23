import 'package:impaktfull_ui_figma_sync/src/model/figma/file/file_role.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/file/node_response.dart';

class FigmaNodesResponse {
  final String name;
  final String thumbnailUrl;
  final DateTime lastModified;
  final String version;
  final FigmaFileRole role;
  final Map<String, FigmaNodeResponse> nodes;

  FigmaNodesResponse({
    required this.name,
    required this.thumbnailUrl,
    required this.lastModified,
    required this.version,
    required this.role,
    required this.nodes,
  });

  factory FigmaNodesResponse.fromJson(Map<String, dynamic> json) {
    return FigmaNodesResponse(
      name: json['name'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      lastModified: DateTime.parse(json['lastModified'] as String),
      version: json['version'] as String,
      role: FigmaFileRole.fromString(json['role'] as String),
      nodes:
          (json['nodes'] as Map<String, dynamic>).map((key, value) => MapEntry(
                key,
                FigmaNodeResponse.fromJson(value as Map<String, dynamic>),
              )),
    );
  }
}
