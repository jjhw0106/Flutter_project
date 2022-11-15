import 'package:flutter/material.dart';

import 'dice.dart';

class LogIn extends StatefulWidget {
  final String title;

  const LogIn({Key? key, required this.title}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

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
      body: SingleChildScrollView(
        child: Column(
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
                data: ThemeData(
                  primaryColor: Colors.teal,
                  inputDecorationTheme: InputDecorationTheme(
                    labelStyle: TextStyle(
                      color: Colors.teal,
                      fontSize: 15.0,
                    )
                  )
                ),
                child: Container(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    children: <Widget> [
                      TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          labelText: 'Enter "Dice"',
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextField(
                        controller: controller2,
                        decoration: InputDecoration(
                          labelText: 'Enter "Password"',
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      SizedBox(height: 35,),
                      ButtonTheme(
                        minWidth: 100,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orangeAccent,
                              fixedSize: Size(35, 35),
                            ),
                            child: Icon(Icons.arrow_forward),
                            onPressed: (){
                              if('Dice' != controller.text){
                                Exception("아이디가 틀렸습니다.");
                              } else if('1234' != controller2.text){
                                Exception("비밀번호가 틀렸습니다.");
                              }
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => Dice(id: controller.text))
                              );
                            },
                        )
                      ),
                    ],
                  )
                ))
            )
          ],
        ),
      ),
    );
  }
}
