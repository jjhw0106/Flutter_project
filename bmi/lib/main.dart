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

  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
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
                  controller: _heightController,
                  validator: (value) {
                    if(value!.trim().isEmpty){
                      return "키를 입력하세요";
                    }
                    return null;  // validator의 반환값이 null이면 Error 없는 것
                  },
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
                  controller: _weightController,
                  validator: (value) {
                    if(value!.trim().isEmpty){
                      return "몸무게를 입력하세요";
                    }
                    return null;  // validator의 반환값이 null이면 Error 없는 것
                  },
                  keyboardType: TextInputType.number,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16.0),
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed:() {
                      // 폼 입력값 검증
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> BmiResult(
                              double.parse(_heightController.text.trim()),
                              double.parse(_weightController.text.trim()))
                            )
                        );
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

    final bmi = weight / ((height/100)*(height/100));
    print('bmi:$bmi');

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
                _calcBmi(bmi),
                style: TextStyle(fontSize: 36),
              ),
              SizedBox(
                height: 16,
              ),
              _buildIcon(bmi),
            ],
          )
        )
      ),
    );
  }
  String _calcBmi(double bmi){
    var result= '저체중';
    if(bmi >= 35){
      result = '고도 비만';
    } else if(bmi>=30){
      result = '2단계 비만';
    } else if(bmi>=25){
      result = '1단계 비만';
    } else if(bmi>=23){
      result = '과체중';
    } else if(bmi>=18.5){
      result = '정상';
    }
    return result;
  }
  Widget _buildIcon(double bmi){
    if(bmi>=23){
      return Icon(
        Icons.sentiment_very_dissatisfied,
        color: Colors.red,
        size:100,
      );
    } else if(bmi>=18.5){
      return Icon(
          Icons.sentiment_very_dissatisfied,
          color: Colors.red,
          size:100,
      );
    } else {
      return Icon(
        Icons.sentiment_dissatisfied,
        color: Colors.orange,
        size: 100,
      );
    }
  }
}
