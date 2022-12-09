void main() async {
  methodA();
  await methodB();
  await methodC('main');
  methodD();
}

methodA(){
  print('A');
}

methodB() async {
  print('B starts');
  await methodC('B');
  print('B end');
}

methodC(String from) async {
  print('C start from $from');

  await Future((){
    print('C running Future from $from');
  }).then((_){
    print('C end of Future from $from');
  });

  print('C end from $from');

}

methodD(){
  print('D');
}