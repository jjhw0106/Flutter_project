import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return bookItemContainer();
  }
}

Widget bookItemContainer(){
  return SizedBox(
    height: 70,
    width: 100,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(27.3, 0, 17.3, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Flexible(
            flex: 8,
            child: Text(
              "slkdfjeoiwuqprowiuesldkfjsvl;jzxc;lkdsagh;lsahdf;ldskj", 
              overflow: TextOverflow.ellipsis,
              // maxLines: 1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'Noto_Sans_KR-Medium'),
                ),
          ),
          Flexible(
            flex: 2,
            child: Icon(Icons.arrow_forward_ios_rounded)),
          // const SizedBox(width: 50),
        ],
      ),
    ),
  );
}