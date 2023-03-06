import 'package:dev_test/helpers/enums.dart';
import 'package:dev_test/ui/workbook/study_enrollment.dart';
import 'package:flutter/material.dart';

AppBar appBar({String? selected, required String message}) {
  return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.black, //change your color here
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: true,
      centerTitle: true,
      title: Text(message,
          style: const TextStyle(
            color: Colors.black, 
            fontSize: 21.7,
            fontWeight: FontWeight.bold
            ),
          ),
    );
}

// 단계 이동 버튼
// ButtonStyle, MaterialStateProperty를 활용하여 클릭시 버튼 색 반전
// next클릭시 이동할 페이지 get
Widget moveStep(BuildContext context, Enum move, String message, {dynamic nextPage}) {
  const double fontSize = 16;
  ButtonStyle style = moveStepButtonStyle(fontSize);
  return ElevatedButton(
    onPressed: () {
      if (move == UiHelpers.prev) {
        Navigator.pop(context);
      } else if (move == UiHelpers.next) {
          if(nextPage == null) {
            showDialog(context: context, builder: (context) => const Text("학습 타입을 선택해주세요"),);
            return ;
          }
        Navigator.push(context, MaterialPageRoute(builder: (context) => nextPage));
      }
    },
    style: style,
    child: Text(message),
  );
}

ButtonStyle moveStepButtonStyle(double fontSize) {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(const Color(0xfff6f7fa)),
    foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
      if (states.contains(MaterialState.pressed)) {
        return Colors.white;
      }
      return const Color(0xff5664cd);
    }),
    side: MaterialStateProperty.all<BorderSide>(const BorderSide(width: 1, color: Color(0xff5664cd))),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(80)
        ),
      ),
    textStyle: MaterialStateProperty.all<TextStyle>(
      TextStyle(
        color: Colors.white, 
        fontSize: fontSize, 
        fontWeight: FontWeight.bold
      ),
    ),
    elevation: MaterialStateProperty.all(0),
    minimumSize: MaterialStateProperty.all(const Size(143.3, 54)),
    overlayColor: MaterialStateProperty.resolveWith((states) {
      return states.contains(MaterialState.pressed)
          ? const Color(0xff5664cd)
          : null;
    }),
  );
}
  