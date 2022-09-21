import 'package:flutter/material.dart';

class happyMain extends StatefulWidget {
  const happyMain({Key? key}) : super(key: key);

  @override
  State<happyMain> createState() => _happyMainState();
}

class _happyMainState extends State<happyMain> {

  final _items = <HappyInfo>[];

  var _nameController = TextEditingController();
  var _dateController = TextEditingController();
  var _moneyController = TextEditingController();
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
            _buildTop(),
            Expanded(child:_buildMiddle()),
            Container(child:_buildBottom()),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
        ),
      ]),
    );
  }
  Widget _buildTop(){
    return _textFieldForm();
  }
  Widget _buildMiddle(){
    return Container(
        color: Colors.blue,
        child:_listViewForm()
    );
  }
  Widget _buildBottom(){
    return Text("bottom");
  }

  void _addInfo(HappyInfo happyInfo){
    setState(() {
      _items.add(happyInfo);
      _nameController.text = '';
    });
    print('nameController: $_nameController.ㅍ');
  }
  Widget _textFieldForm(){
    return Container(
      height: 100,
      child: Row(
        children: [
          Flexible(flex:1,child:TextField(decoration: InputDecoration(border:OutlineInputBorder(),labelText: '이름')),),
          SizedBox(width:5),
          Flexible(flex:1,child:TextField(decoration: InputDecoration(border:OutlineInputBorder(),labelText: '날짜')),),
          SizedBox(width:5),
          Flexible(flex:1,child:TextField(decoration: InputDecoration(border:OutlineInputBorder(),labelText: '축의금')),),
          SizedBox(width:5),
          Flexible(flex:1,child:ElevatedButton(
            child: Icon(Icons.add)
            ,onPressed: ()=>_addInfo(
              HappyInfo(
              _nameController.text,
              _dateController.text,
              _moneyController.text
              ),
            ),
          )
          )
        ],
      ),
    );
  }
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



Widget _listViewForm(){
  final items = <HappyInfo>[];
  var _todoController = TextEditingController();
  return ListView(
    children: [],
  );
}



class HappyInfo{
  String name;
  String date;
  String money;

  HappyInfo(this.name, this.date, this.money);
}