import 'package:dev_test/common/global_variable.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class StudyEnrollmentProvider {

  final GlobalVariable _globalVariable = GlobalVariable();

  // 카카오 책정보 불러오기
  Future<List<dynamic>> getBooksFromKakao(String? title) async {
    // API 연결 위한 DIO
    String kakaoKey = dotenv.get('KAKAO_RESTAPI_KEY');
    var options = BaseOptions(
      baseUrl: 'https://dapi.kakao.com/v3/search/book',
      queryParameters: {
        'query':title
        ,'sort':'accuracy'
        ,'size':'50'
        },
      connectTimeout: 3000,
      headers: {'Authorization': 'KakaoAK $kakaoKey' },
    );
    Dio dio = Dio(options);

    try {
      Response<dynamic> response = await dio.get(''); // queryParameters: {"query": '$title', 'sort': 'accuracy','size': 50,}
      Map<String, dynamic> data = response.data;
      print("API Connected");
      return data["documents"];
    } catch (e) {
      print("API Error: $e");
      throw Exception();
    }
  }

  Future<String> test(String test) async{
    Dio dio =Dio();

    try {
      // Response<dynamic> result = await dio.get(
      //   _globalVariable.url + 'workbook/saveMyWorkbook',
      // );

      return "success";
    } on DioError catch (err) {
      return err.toString();
    }
  }
}
