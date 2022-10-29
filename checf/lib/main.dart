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
//         title: Text('Snack Bar!'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: ElevatedButton(
//           child: Text('Click'),
//           onPressed:() {
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                   content: Text('Clicked!!',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: Colors.white),
//                 ),
//               backgroundColor: Colors.teal,
//               duration: Duration(milliseconds: 1000),
//
//             )
//             );
//           },
//         ),
//       ),
//     );
//   }
// }


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
//       title: 'Snack bar',
//       theme: ThemeData(
//         primarySwatch: Colors.red
//       ),
//       home: MyPage(),
//     );
//   }
// }
//
// class MyPage extends StatelessWidget {
//   const MyPage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('SnackBar'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: ElevatedButton(
//           child: Text(
//             'Show me',
//             style: TextStyle(color: Colors.white),
//           ),
//           onPressed: (){
//             //SnackBar 구현
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                 content: Text('New Snack Bar'),
//             )
//             );
//             // Scaffold.of(context).showSnackBar(snackbar)
//
//             print('button tapped!!!!!');
//           },
//         )
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//     debugShowCheckedModeBanner: false,
//       title: 'BBANTO',
//       home: Grade(),
//     );
//   }
// }
//
// class Grade extends StatelessWidget {
//   const Grade({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             UserAccountsDrawerHeader(
//               currentAccountPicture:
//                 CircleAvatar(
//                   backgroundImage: AssetImage("assets/1.png"),
//                   backgroundColor: Colors.white,
//                 ),
//               otherAccountsPictures: <Widget>[
//                 CircleAvatar(
//                   backgroundImage: AssetImage('assets/1.png'),
//                   backgroundColor: Colors.white,
//                 )
//               ],
//               accountName: Text('BBANTO'),
//               accountEmail: Text('bbanto@bbanto.com'),
//               onDetailsPressed: () {
//                 print('arrow is clicked');
//               },
//               decoration: BoxDecoration(
//                 color: Colors.red[200],
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(40.0),
//                   bottomRight: Radius.circular(40.0),
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.home,
//                 color: Colors.grey[850],
//               ),
//               title: Text('Home'),
//               onTap: (){
//                 print('tapped1!!!!!!!!!');
//               },
//               trailing: Icon(Icons.add),
//             ),
//             ListTile(
//               leading: Icon(Icons.settings,
//                 color: Colors.grey[850],
//               ),
//               title: Text('Setting'),
//               onTap: (){
//                 print('tapped2!!!!!!!!!');
//               },
//               trailing: Icon(Icons.add),
//             ),
//             ListTile(
//               leading: Icon(Icons.question_answer,
//                 color: Colors.grey[850],
//               ),
//               title: Text('Q&A'),
//               onTap: (){
//                 print('tapped3!!!!!!!!!');
//               },
//               trailing: Icon(Icons.add),
//             ),
//           ],
//         ),
//       ),
//       appBar: AppBar(
//         title: Text('Appbar icon menu'),
//         centerTitle: true,
//         elevation: 0.0,
//         backgroundColor: Colors.amber[800],
//         leading:
//         IconButton(
//           icon: Icon(Icons.menu),
//           onPressed: () {
//             print('menu button is clicked');
//           },
//         ),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.shopping_cart),
//             onPressed: (){
//               print('Shopping cart button is clicked');
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: (){
//               print('Search button is clicked');
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
