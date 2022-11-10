import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  final String title;

  const LogIn({Key? key, required this.title}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: (){}
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: (){}
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(padding: const EdgeInsets.only(top: 50),),
            Center(
              child: Image(
                image: AssetImage('image/chef.gif'),
                width: 170,
                height: 190,
              ),
            ),
          Form(child: Theme(
              data: ThemeData(),
              child: null)
          )
        ],
      ),
    );
  }
}
