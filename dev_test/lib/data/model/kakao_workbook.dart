import 'package:intl/intl.dart';

class KakaoWorkbook {
  final String title;
  final String contents;
  final String url;
  final String isbn;
  final String datetime;
  final List<String> authors;
  final String publisher;
  final List<String> translators;
  final int price;
  final int? salePrice;
  final String thumbnail;
  final String status;

  KakaoWorkbook(
    this.title,
    this.contents,
    this.url,
    this.isbn,
    this.datetime,
    this.authors, 
    this.publisher,
    this.translators,
    this.price,
    this.salePrice,
    this.thumbnail,
    this.status,
  );

  // named constructor
  // List로 넘어오는 JSON value 다루기
  //  우선 map 객체를 List로 변환
  //  .map을 써서 각 요소(e)를 돌며 원하는 타입으로 변환
  //  .toList()로 리스트 형태 반환
  KakaoWorkbook.fromMap(Map<String, dynamic> mapItem)
    : title = mapItem['title'], 
      contents = mapItem['contents'],
      url = mapItem['url'],
      isbn = mapItem['isbn'],
      datetime = (mapItem['datetime'] as String).substring(0,10),
      authors = (mapItem['authors'] as List).map((e) => (e as String)).toList(),
      publisher = mapItem['publisher'],
      translators = (mapItem['translators'] as List).map((e) => (e as String)).toList(),
      price = mapItem['price'],
      salePrice = mapItem['salePrice'],
      thumbnail = mapItem['thumbnail'],
      status = mapItem['status']
      ;
}