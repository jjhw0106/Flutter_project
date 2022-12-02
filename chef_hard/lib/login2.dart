import 'package:flutter/material.dart';

class Login2 extends StatelessWidget {
  const Login2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Sign in',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonDesign("image/google-logo.png", "Google"),
            ButtonDesign("image/facebook-logo.png", "Facebook"),
            ButtonDesign("", "Email"),
          ],
        )
      ),
    );
  }
}

class ButtonDesign extends StatelessWidget {

  String mediaAddress;
  String mediaName;
  // final media = [
  //   {
  //     name: "Google",
  //     url: 'image/google-logo.png'
  //   },
  //   {"Facebook", 'image/facebook-logo.png'},
  //   {"Email", ''},
  // ];

  ButtonDesign(this.mediaAddress, this.mediaName);

  // const ButtonDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 50,
      child: TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image(
              width: 25,
              image: AssetImage('$mediaAddress'),
            ),
            Text('Login with $mediaName',
              style: TextStyle(fontSize: 15),
            ),
            Opacity(
              opacity: 0,
              child: Image(
                width: 25,
                image: AssetImage('$mediaAddress'),
              ),
            )
          ],
        ),
        onPressed: (){},
        onLongPress: (){
          print('Text Button');
        },
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.blue[900],
          side: BorderSide(width: 0.5),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              )
          ),
        ),
      ),
    );
  }
}
