import 'package:netflix_clone/core/network/dio_client.dart';
import 'package:netflix_clone/util/endpoints.dart';

class ComingSoonApi {
  final DioClient _dioClient;

  ComingSoonApi(this._dioClient);

  Future<Map<String, dynamic>> fetchComingSoonApiRequest(int page) async {
    try {
      final params = {'page': page + 1};
      final res =
          await _dioClient.get(Endpoints.comingSoon, queryParameters: params);
      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}
