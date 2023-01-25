class Message{
  int pointType;
  String title;
  String? contents1;
  String? contents2;
  String? contents3;

  Message(this.pointType, this.title, this.contents1, {this.contents2, this.contents3} );
}