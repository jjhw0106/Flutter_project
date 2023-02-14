import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SetStudyProvider {
  // dbhelper

  // 카카오 책정보 불러오기
  Future<List<dynamic>> getBooksFromKakao(String? title) async {
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
      Response<dynamic> response = await dio.get('https://dapi.kakao.com/v3/search/book', queryParameters: {"query": '$title', 'sort': 'accuracy','size': 50,});
      Map<String, dynamic> data = response.data;
      print("응답 ${response.data}");
      return data["documents"];
    } catch (e) {
      print("에러 $e");
      throw Exception();
    }
  }
}
