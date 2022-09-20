import 'package:flutter/material.dart';

// class happyMain extends StatefulWidget {
//   const happyMain({Key? key}) : super(key: key);
//
//   @override
//   State<happyMain> createState() => _happyMainState();
// }
//
// class _happyMainState extends State<happyMain> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(x
//       home: Scaffold(
//         appBar: AppBar(
//           title:Text("Page 1"),
//         ),
//       )
//     );
//   }
// }
class happyMain extends StatelessWidget {
  const happyMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Happy"),
        centerTitle: true,
      ),
      body: SizedBox(
        width:double.infinity,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(child:_buildTop()),
            Container(child:_buildMiddle()),
            Container(child:_buildBottom()),
          ],
        ),
      ),
    );
  }
}

Widget _buildTop(){
  return SizedBox(
    width: 200,
    child: Row(
      children: <Widget>[
        _textFieldForm(),
      ],
    ),
  );
}
Widget _buildMiddle(){
  return Text('middle');
}
Widget _buildBottom(){
  return Text('bottom');
}

class _MyCustomTextField extends StatefulWidget {
  const _MyCustomTextField({Key? key}) : super(key: key);

  @override
  State<_MyCustomTextField> createState() => _MyCustomTextFieldState();
}

class _MyCustomTextFieldState extends State<_MyCustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Widget _textFieldForm(){
  return TextField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      labelText: 'Type your Number',
      hintText: '1234',
    ),

    onChanged: (value) {
    },
  );
}