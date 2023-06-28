import 'package:netflix_clone/core/network/dio_client.dart';
import 'package:netflix_clone/util/endpoints.dart';

class NowPlayingApi {
  final DioClient _dioClient;

  NowPlayingApi(this._dioClient);

  Future<Map<String, dynamic>> fetchNowPlayingApiRequest() async {
    try {
      final res = await _dioClient.get(Endpoints.nowPlaying);
      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}


