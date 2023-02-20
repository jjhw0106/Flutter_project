import 'package:dio/dio.dart';

String KAKAO_KEY = 'caaf835809f37a3a4ba57138eb4e9b99';

Dio dio = Dio();

late Response response;

Future<Response> searchBooks() async {
  response = await dio.get(
    'https://dapi.kakao.com/v3/search/book',
    // options: Options(
    //   headers: <String, dynamic>{
    //     'Authorization' = KAKAO_KEY
    //   }
    // )
  );
  return response;
}
