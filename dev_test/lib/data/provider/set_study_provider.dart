import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SetStudyProvider {
  // dbhelper

  // 카카오 책정보 불러오기
  Future<Map<String, dynamic>> getBooksFromKakao(String? title) async {
    // API 연결 위한 DIO
    Dio dio = Dio();
    String kakaoKey = dotenv.get("KAKAO_REST_KEY");
    print("provider!!");
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'KakaoAK $kakaoKey';
          return handler.next(options);
        },
      ),
    );
    try {
      final response = await dio.get('https://dapi.kakao.com/v3/search/book', queryParameters: {"query": '$title'});
      Map<String, dynamic> data = response.data;
      print("응답: ${data["documents"]}");

      return data;
    } catch (e) {
      print("에러 $e");
      throw Exception();
    }
  }
}
