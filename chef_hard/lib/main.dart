import 'package:chef_hard/flutter_future_ex/main.dart';
import 'package:chef_hard/increment_decrement.dart';
import 'package:chef_hard/login2.dart';
import 'package:flutter/material.dart';
import 'package:chef_hard/login_app/login3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

/*
* 1. IncrementDecrement
* 2. login_dice
* 3. Firebase login app
* 4. LogIn() (../login3)
* 5. FutureEx()
* */
class MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FutureEx(),
    );
  }
}



// import 'package:chef_hard/main.dart';
// import 'package:flutter/material.dart';
//
// void main(){
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Future',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: Home(),
//     );
//   }
// }
//
// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//
//   String result = 'no data found';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Future test'),
//         centerTitle: true,
//       ),
//       body: Center(
//           child: Padding(
//               padding: EdgeInsets.all(30.0),
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     ElevatedButton(
//                       onPressed: (){
//                         futureTest();
//
//                       },
//                       child: Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text(
//                             'Future test',
//                             style: TextStyle(fontSize: 20),
//                           )
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       result,
//                       style: TextStyle(fontSize: 20, color: Colors.redAccent),
//                     )
//                   ]
//               )
//           )
//       ),
//     );
//   }
//   void futureTest(){
//     Future.delayed(Duration(seconds: 3))
//         .then((value){
//       setState((){
//         this.result = 'The data is fetched';
//       });
//     }
//     );
//   }
// }



