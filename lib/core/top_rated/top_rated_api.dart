import 'package:netflix_clone/core/network/dio_client.dart';
import 'package:netflix_clone/util/endpoints.dart';

class TopRatedApi {
  final DioClient _dioClient;

  TopRatedApi(this._dioClient);

  Future<Map<String, dynamic>> fetchTopRatedApiRequest() async {
    try {
      final res = await _dioClient.get(Endpoints.topRated);
      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}


