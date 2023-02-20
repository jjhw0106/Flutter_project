import 'package:flutter/material.dart';

class BookInfo {
  final String contents;
  final String title;
  final String url;
  final String isbn;
  final DateTime datetime;
  final List<String> authors;
  final String publisher;
  final List<String> translator;
  final int price;
  final int salePrice;
  final String thumbnail;
  final String status;


  BookInfo(
    this.contents,
    this.title,
    this.url,
    this.isbn,
    this.datetime,
    this.authors,
    this.publisher,
    this.translator,
    this.price,
    this.salePrice,
    this.thumbnail,
    this.status
  );
  

}
