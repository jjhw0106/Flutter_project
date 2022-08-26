import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BmiMain(),
    );
  }
}


// 첫 페이지
class BmiMain extends StatefulWidget {
  const BmiMain({Key? key}) : super(key: key);

  @override
  State<BmiMain> createState() => _BmiMainState();
}

class _BmiMainState extends State<BmiMain> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('비만도 계산기'),
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '키',
                  ),
                  keyboardType: TextInputType.number, // 숫자만 입력 가능
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "몸무게",
                  ),
                  keyboardType: TextInputType.number,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16.0),
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed:() {
                      if (_formKey.currentState!.validate()) {

                      }
                    },
                    child: Text('결과'),
                  )
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}

// 두번째 페이지
class BmiResult extends StatelessWidget {
  final double height;
  final double weight;

  const BmiResult(this.height, this.weight);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text('비만도 계산기'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "정상",
                style: TextStyle(fontSize: 36),
              )
            ],
          )
        )
      ),
    );
  }
}
