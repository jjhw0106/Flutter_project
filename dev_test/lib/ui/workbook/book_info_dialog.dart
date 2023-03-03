import 'package:dev_test/data/model/kakao_workbook.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// 컴파일되는 순간 미리 만들어 놓는것인지?
Future bookInfoDialog(BuildContext context, KakaoWorkbook selectedBook) async {
  const double contentFontSize = 12.7;
  const double titleFontSize = 14.0;
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 403.3, maxWidth: 269.3),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          // 썸네일
          _thumbnailBox(selectedBook),
          const SizedBox(height: 20),
          // 제목, 한 곳만 코드가 들어가서 위젯으로 안 뺌
          _titleBox(selectedBook, titleFontSize),
          const SizedBox(height: 15),
          // 출판사
          _dialogContentsRow(contentFontSize, selectedBook, selectedBook.publisher, "출판사명"),
          // 출판일
          _dialogContentsRow(contentFontSize, selectedBook, selectedBook.datetime, "출판일"),
        ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: _buttonStyleButton(context, "취소"),
            ),
            Expanded(
              child: _buttonStyleButton(context, "선택"),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _titleBox(KakaoWorkbook selectedBook, double titleFontSize) {
  return SizedBox(
          height: 50,
          width: 209,
          child: Align(
            alignment: Alignment.center,
            child: Text(selectedBook.title,
                style: TextStyle(
                    fontSize: titleFontSize,
                    fontFamily: 'NotoSansKR-Medium',
                    fontWeight: FontWeight.bold)),
          ),
        );
}

// 도서정보 Row
// selectedBook : 선택된 도서 전체 정보
// searchingKey : API 쿼리 key
// searchingKeyName : key에 해당하는 한국명
Widget _dialogContentsRow(double fontSize, KakaoWorkbook selectedBook, String searchingValue, String searchingKeyName) {
  return SizedBox(
    child: Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height:40,
        decoration: const BoxDecoration(border: Border(top: BorderSide(width: 1,color: Color(0xffeeeeee)))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 60,
              child: Text(
                searchingKeyName,
                style: TextStyle(
                    color: const Color(0xff66000000),
                    fontSize: fontSize,
                    fontFamily: 'NotoSansKR-Medium',
                    fontWeight: FontWeight.bold
                    ),
              ),
            ),
            Text(
              searchingValue,
              style: TextStyle(
                fontSize: fontSize,
                fontFamily: 'NotoSansKR-Medium',
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// 썸네일 Image.network로 받아오기
// shadow 넣기
// 이미지 크기 컨테이너에 맞추기
Widget _thumbnailBox(KakaoWorkbook selectedBook) {
  return SizedBox(
    child: Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              )
            ],
          ),
          height: 137,
          child: Image.network(
            selectedBook.thumbnail,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const Center(child: Text('no Image')),
          ),
        ),
      ),
    ),
  );
}

// sp -> 폰트 사이즈, build때 화면에서 가로폭 세로높이 구하는 메소드 존재(상대적으로) 기존 코드 참고
// ButtonStyle - MaterialStateProperty로 이벤트 시 ui rebuild
Widget _buttonStyleButton(BuildContext context, String message) {
  return ElevatedButton(
    onPressed: () => Navigator.pop(context),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xfff6f7fa)),
      foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.pressed)) {
          return Colors.white;
        }
        return Colors.black;
      }),
      textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(color: Colors.white)),
      elevation: MaterialStateProperty.all(0),
      overlayColor: MaterialStateProperty.resolveWith((states) {
        return states.contains(MaterialState.pressed)
            ? const Color(0xff5664cd)
            : null;
      }),
    ),
    child: Text(message),
  );
}