import 'package:netflix_clone/core/network/dio_client.dart';
import 'package:netflix_clone/util/endpoints.dart';

class MovieDetailsApi {
  final DioClient _dioClient;

  MovieDetailsApi(this._dioClient);

  Future<Map<String, dynamic>> fetchMovieDetailsApiRequest(int id) async {
    try {
      final res = await _dioClient.get("/$id?language=en-US");
      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}


