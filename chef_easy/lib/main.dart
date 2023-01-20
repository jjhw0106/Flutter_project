

// 플러터 v2.0 버튼 정리
// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHome(),
//     );
//   }
// }
//
// class MyHome extends StatelessWidget {
//   const MyHome({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Button'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextButton(
//               onPressed: (){},
//               onLongPress: (){
//                 print('Text Button');
//               },
//               child: Text('Text Button',
//                 style: TextStyle(fontSize: 20),
//               ),
//               style: TextButton.styleFrom(
//                 primary: Colors.red,
//               ),
//             ),
//             ElevatedButton(
//               onPressed: (){
//                 print('Elevated Button');
//               },
//               child: Text('Elevated Button'),
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.orangeAccent,
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
//                 elevation: 0,
//               ),
//             ),
//             ElevatedButton(
//               onPressed: null, // onPressed에 null을 대입하면 비활성화 됨
//               child: Text('비활성 버튼'),
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.orangeAccent,
//                 onSurface: Colors.pink,     // 비활성화 된 버튼의 색상 변경
//               ),
//             ),
//             OutlinedButton(
//               onPressed: (){
//                 print('Outlined Button');
//               },
//               child: Text('Outlined Button'),
//               style: OutlinedButton.styleFrom(
//                 primary: Colors.green,
//                 side: BorderSide(
//                   color: Colors.green,
//                   width: 2,
//                 )
//               ),
//             ),
//             // 아이콘 있는 버튼
//             TextButton.icon(
//               onPressed: (){print('Button with Icon');},
//               icon: Icon(
//                 Icons.home,
//                 size: 30,
//                 color: Colors.black87,
//               ),
//               label: Text('Go to Home'),
//               style: TextButton.styleFrom(
//                 primary: Colors.purple,     // 아이콘에서 색상 따로 지정안하면 아이콘에도 색상이 적용됨
//               ),
//             ),
//             // 버튼들을 끝정렬 (가로방향, 공간없으면 세로로)
//             ButtonBar(
//               alignment: MainAxisAlignment.center,
//               buttonPadding: EdgeInsets.all(20),
//               children: [
//                 TextButton(onPressed: (){}, child: Text('Text Button')),
//                 ElevatedButton(onPressed: (){}, child: Text('Elevated Button')),
//               ],
//             )
//           ],
//         )
//       )
//     );
//   }
// }




// Scaffold Messenger
// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyPage(),
//     );
//   }
// }
//
// class MyPage extends StatelessWidget {
//   const MyPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Scaffold Messenger'),
//       ),
//       body: HomeBody(),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.thumb_up),
//         onPressed: (){
//           ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text('Like a new SnackBar'),
//                 duration: Duration(seconds: 5),
//                 action: SnackBarAction(
//                   label: 'Undo',
//                   onPressed: (){
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context)=>ThirdPage()),
//                     );
//                   },
//                 ),
//               )
//           );
//         },
//       ),
//     );
//   }
// }
//
// class HomeBody extends StatelessWidget {
//   const HomeBody({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ElevatedButton(
//         child: Text('Go to the second Page'),
//         onPressed: (){
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondPage()));
//         },
//       ),
//     );
//   }
// }
//
// class SecondPage extends StatelessWidget {
//   const SecondPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Second Page'),
//       ),
//       body: Center(
//         child: Text(
//           '좋아요가 추가되었습니다.',
//           style: TextStyle(
//             fontSize: 20.0,
//             color:Colors.redAccent,
//           ),
//         )
//       )
//     );
//   }
// }
//
// class ThirdPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ScaffoldMessenger(
//       child: Scaffold(
//           appBar: AppBar(
//             title: Text('Third Page'),
//           ),
//           body: Builder(
//             builder: (context) {
//               return Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         '좋아요를 취소하시겠습니까?',
//                         style: TextStyle(
//                           fontSize: 20.0,
//                           color:Colors.redAccent,
//                         ),
//                       ),
//                       ElevatedButton(
//                           onPressed: (){
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 content: Text('좋아요가 취소되었습니다'),
//                                 duration: Duration(seconds: 3),
//                               ),
//                             );
//                           },
//                           child: Text('취소하기')
//                       )
//                     ],
//                   )
//               );
//             }
//           )
//       ),
//     );
//   }
// }



import 'package:checf/ScreenB.dart';
import 'package:checf/ScreenC.dart';
import 'package:flutter/material.dart';
import 'package:checf/ScreenA.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/'  : (context) => ScreenA(),
        '/b' : (context) => ScreenB(),
        '/c' : (context) => ScreenC(),
      },
    );
  }
}