import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SetStudyProvider{
  // dbhelper


  // 카카오 책정보 불러오기
  Future<List<dynamic>> getBooksFromKakao() async{
    // API 연결 위한 DIO
    Dio dio = Dio();
    String kakaoKey = dotenv.get("KAKAO_REST_KEY");
    try{
      Response<dynamic> result = await dio.get("https://dapi.kakao.com/v3/search/book?sort=accuracy&page=1&size=10");
      print(result);
      return [];
    }
    catch(err){
      return [];
    }
  }
}
