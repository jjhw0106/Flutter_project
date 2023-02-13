import 'package:dio/dio.dart';

Future<void> main() async {
  // Controller c = Controller();

  // print("a");
  // c.init();
  // print("result: ${await c.result}");
  // // print(await c.result);
  // print("b");

  bool isLoading = false;
  print(isLoading?"A":"B");
}


class Controller {
    late dynamic result;

    void init(){
      result = searchBooks();
    }

    Future<dynamic> searchBooks() async {
    Dio dio = Dio();
    const String KAKAO_KEY = 'caaf835809f37a3a4ba57138eb4e9b99';

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
      // print(response.data);
      return response.data;
      // print(data);
    } catch (e) {
      print("에러 $e");
    }
  }
}