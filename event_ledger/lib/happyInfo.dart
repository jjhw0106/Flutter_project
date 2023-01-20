class HappyInfo{
  String name;
  String date;
  int money;

  HappyInfo( this.name,  this.date,  this.money);

  Map<String, dynamic> toMap(){
    return {
      'name' : name,
      'date' : date,
      'money': money,
    };
  }
}

