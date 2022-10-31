import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: FirstPage()
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child:Text('Go to the second page'),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (_) => SecondPage()
            )
            );
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second page'),
      ),
      body: Center(
        child: ElevatedButton(
          child:Text('Go to the First page'),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
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
//         title: Text('Toast Message'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             flutterToast();
//           },
//           child: Text('Toast'),
//         )
//       )
//     );
//   }
// }
//
// void flutterToast(){
//   Fluttertoast.showToast(msg: 'Toast Message',
//     gravity: ToastGravity.BOTTOM,
//     backgroundColor: Colors.redAccent,
//     fontSize: 15,
//     textColor: Colors.white,
//     toastLength: Toast.LENGTH_SHORT,
//   );
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
//     debugShowCheckedModeBanner: false,
//       title: 'BBANTO',
//       home: Grade(),
//     );
//    }
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
