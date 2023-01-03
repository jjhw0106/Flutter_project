import 'package:flutter/material.dart';

class SubjectModel extends StatefulWidget {
  // const SubjectModel({Key? key}) : super(key: key);

  int? _index;
  bool? _isClicked;

  SubjectModel(_index, _isClicked){
    _index = this._index;
    _isClicked = this._isClicked;
  }

  @override
  State<SubjectModel> createState() => _SubjectModelState();
}

class _SubjectModelState extends State<SubjectModel> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          changeColor();
          print(widget._isClicked);
        },
        child: Container(
          child: Center(child: Text("")),
          color: widget._isClicked==true ? Colors.yellow : Colors.blue,
          height: 50,
          width: 50,
        ),
      ),
    );
  }

  void changeColor(){
    setState(() {
      widget._isClicked == true ? widget._isClicked = false : widget._isClicked = true;
      // if(isClicked == true){isClicked = false;}
      // else {isClicked = true;}
    });
  }
}
