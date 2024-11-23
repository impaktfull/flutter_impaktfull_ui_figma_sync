import 'package:impaktfull_ui_figma_sync/src/model/figma/file/file_response.dart';
import 'package:impaktfull_ui_figma_sync/src/model/figma/file/nodes_response.dart';
import 'package:impaktfull_ui_figma_sync/src/service/figma_api.dart';

class FigmaService {
  final FigmaApi api;

  FigmaService({
    required this.api,
  });

  Future<FigmaFileResponse> getFile(String fileKey) async {
    final response = await api.get(path: 'v1/files/$fileKey');
    return FigmaFileResponse.fromJson(response);
  }

  Future<FigmaNodesResponse> getNodes(
    String fileKey,
    Iterable<String> nodeIds,
  ) async {
    final response = await api.get(
      path: 'v1/files/$fileKey/nodes',
      queryParameters: {
        'ids': nodeIds.join(','),
      },
    );
    return FigmaNodesResponse.fromJson(response);
  }
}
