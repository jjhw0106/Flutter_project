import 'package:chef_hard/my_buttons/my_button.dart';
import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0.2,
      ),
      body: _buildButton(),
    );
  }

  Widget _buildButton() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MyButton(
              image: Image(image: AssetImage('image/facebook-logo.png'),height: 35,),
              text: Text("LogIn with Facebook"),
              color: Colors.white,
              backgroundColor: Colors.blue[800],
              radius: 8.0,
              onPressed: (){}
          ),
          SizedBox(height: 15,),
          MyButton(
              image: Image(image: AssetImage('image/google-logo.png'),height: 35,),
              text: Text("LogIn with Google"),
              color: Colors.black,
              backgroundColor: Colors.white,
              radius: 8.0,
              onPressed: (){}
          ),
        ],
      ),
    );
  }
}
