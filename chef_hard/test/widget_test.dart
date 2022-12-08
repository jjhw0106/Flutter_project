import 'dart:io'; // socket, http 서버와 통신시 필요

void main() async {
  showData();
}

void showData() async {
  startTask();
  String? account = await accessData();
  fetchData(account);
}

void startTask(){
  String info1 = '요청수행 시작';
  print(info1);
}

Future<String?> accessData() async {
  String? account;

  Duration time = Duration(seconds: 3);
  if(time.inSeconds>2){
    await Future.delayed(time,(){
      account = '데이터 처리 완료';
      print(account);
    });
  }else{
    account = '데이터를 가져왔습니다';
    print(account);
  }
  return account;
}

void fetchData(String? account){
  // account = '잔액은 8,500만원입니다';
  print("$account의 잔액은 8,500만원입니다.");
}
