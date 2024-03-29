import 'package:dio/dio.dart';

void main() async {
  searchBooks();
}

Future<void> searchBooks() async {
  Dio dio = Dio();
  const String KAKAO_KEY = 'caaf835809f37a3a4ba57138eb4e9b99';
  List<dynamic> searchTextList; 

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        options.headers['Authorization'] = 'KakaoAK $KAKAO_KEY';
        return handler.next(options);
      },
      // onResponse: (e, handler) {},
      // onError: (e, handler) {},
    ),
  );
  try {
    Response<dynamic> response = await dio.get(
        'https://dapi.kakao.com/v3/search/book',
        queryParameters: {"query": "미움받을"});
    Map<String, dynamic> data = response.data;
    searchTextList = data["documents"];
    print((searchTextList[3]['datetime'] as String).substring(0,10));
  } catch (e) {
    print("에러 $e");
  }
}
