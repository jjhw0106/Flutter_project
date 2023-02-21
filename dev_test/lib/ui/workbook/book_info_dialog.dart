import 'package:flutter/material.dart';

Future bookInfoDialog(BuildContext context, dynamic selectedBook) async {
  const double fontSize = 13.7;
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 400, maxWidth: 400),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          // 썸네일
          _thumbnailBox(selectedBook),
          const SizedBox(height: 20),
          // 제목
          SizedBox(
            child: Align(
              alignment: Alignment.center,
              child: Text(selectedBook['title'],
                  style: const TextStyle(
                      fontSize: fontSize + 2,
                      fontFamily: 'NotoSansKR-Medium',
                      fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 15),
          // 출판사
          _dialogContentsRow(fontSize, selectedBook, "publisher", "출판사명"),
          // 출판일
          _dialogContentsRow(fontSize, selectedBook, "datetime", "출판일"),
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

Widget _dialogContentsRow(double fontSize, selectedBook, searchingKey, searchingKeyName) {
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
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              selectedBook[searchingKey],
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

Widget _thumbnailBox(selectedBook) {
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
          height: 200,
          child: Image.network(
            selectedBook['thumbnail'],
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const Center(child: Text('no Image')),
          ),
        ),
      ),
    ),
  );
}

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
