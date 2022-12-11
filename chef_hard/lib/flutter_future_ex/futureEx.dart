import 'package:flutter/material.dart';

class FutureEx extends StatefulWidget {
  const FutureEx({Key? key}) : super(key: key);

  @override
  State<FutureEx> createState() => _FutureExState();
}

class _FutureExState extends State<FutureEx> {
  @override
  String result = 'No Data';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future test'),
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: (){
                        futureTest();

                      },
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Future test',
                            style: TextStyle(fontSize: 20),
                          )
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      result,
                      style: TextStyle(fontSize: 20, color: Colors.redAccent),
                    ),
                    Divider(
                      height: 20.0,
                      thickness: 2.0,
                    ),
                    FutureBuilder(
                      future: myFuture(),
                      builder: (context, snapshot) {
                        if(snapshot.connectionState == ConnectionState.done){
                          return Text(
                            snapshot.data.toString(),
                            style: TextStyle(color: Colors.red),
                          );
                        }
                        return CircularProgressIndicator();
                      },
                      // initialData: ,
                    )
                  ]
              )
          )
      ),
    );
  }

  Future<void> futureTest() async {
     await Future.delayed(Duration(seconds: 3))
        .then((value){
      setState((){
        this.result = 'The data is fetched';
        print(result);
        print("Here comes third");
      });
    });
    print('Here comes first');
    print('Here is the last one');
  }

  Future<String> myFuture() async{
    await Future.delayed(Duration(seconds: 2));
    return 'another Future completed';
  }
}

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