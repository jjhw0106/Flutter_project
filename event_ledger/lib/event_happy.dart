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
    return ListView(
      children: <Widget>[
        Container(
          height: 10,
          color:Colors.orange,
        ),
        Container(
          height: 10,
          color:Colors.blue,
        ),
        Container(
          height: 10,
          color:Colors.red,
        ),
      ],
    );
  }

  Widget _buildBottom(){
    return Text("bottom");
  }

  void _addInfo(HappyInfo happyInfo){
    setState(() {
      _items.add(happyInfo);
      _nameController.text = '';
      _dateController.text = '';
      _moneyController.text = '';
    });
    print(_nameController.text);
    print(_dateController.text);
    print(_moneyController.text);
  }
  Widget _textFieldForm(){
    return Container(
      height: 100,
      child: Row(
        children: [
          Flexible(
            flex:1,
            child:TextField(
              controller: _nameController,
              decoration: InputDecoration(border:OutlineInputBorder(),labelText: '이름')
            ),
          ),
          SizedBox(width:5),
          Flexible(
            flex:1,
            child:TextField(
                controller: _dateController,
                decoration: InputDecoration(border:OutlineInputBorder(),labelText: '날짜')
            ),
          ),
          SizedBox(width:5),
          Flexible(
            flex:1,
            child:TextField(
                controller: _moneyController,
                decoration: InputDecoration(border:OutlineInputBorder(),labelText: '축의금')
            ),
          ),
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
  Widget _buildItemWidget(HappyInfo happyInfo){
    return ListTile(

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
Widget _listViewForm(List<HappyInfo> items){
  final _items = <HappyInfo>[];
  var _todoController = TextEditingController();
  return ListView(
    children: <Widget>[
      Text('Items Size : ${items.length}')
    ],
  );
}

class HappyInfo{
  String name;
  String date;
  String money;

  HappyInfo(this.name, this.date, this.money);
}

