import 'package:impaktfull_ui_figma_sync/src/model/figma/file/file_role.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/node/document_node.dart';

class FigmaFileResponse {
  final String name;
  final String thumbnailUrl;
  final DateTime lastModified;
  final String version;
  final FigmaFileRole role;
  final FigmaDocumentNode documents;
  final Map<String, dynamic> styles;

  FigmaFileResponse({
    required this.name,
    required this.thumbnailUrl,
    required this.lastModified,
    required this.version,
    required this.role,
    required this.documents,
    required this.styles,
  });

  factory FigmaFileResponse.fromJson(Map<String, dynamic> json) {
    return FigmaFileResponse(
      name: json['name'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      lastModified: DateTime.parse(json['lastModified'] as String),
      version: json['version'] as String,
      role: FigmaFileRole.fromString(json['role'] as String),
      documents: FigmaDocumentNode.fromJson(json['document'] as Map<String, dynamic>),
      styles: json['styles'] as Map<String, dynamic>,
    );
  }
}
