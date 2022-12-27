import 'package:chef_hard/provider/fish_model.dart';
import 'package:chef_hard/provider/seafish_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FishOrder extends StatelessWidget {
  const FishOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fish = FishOrder();
    return Scaffold(
      appBar: AppBar(
        title: Text('Fish Order'),
      ),
      body: Center(
        child: Column(
          children:[
            Text(
              'Fish name: ${Provider.of<FishModel>(context).name}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height:30),
            High(),
          ]
        )
      ),
    );
  }
}

class High extends StatelessWidget {
  const High({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('1번 매운탕집'),
        SizedBox(height: 30,),
        SpicyA(),
      ],
    );
  }
}

class Middle extends StatelessWidget {
  const Middle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('2번 매운탕집'),
        SizedBox(height:30),
        SpicyB(),
      ],
    );
  }
}


class Low extends StatelessWidget {
  const Low({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('3번 매운탕집'),
        SizedBox(height: 30,),
        SpicyC(),
      ],
    );
  }
}


class SpicyA extends StatelessWidget {
  const SpicyA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('생선번호: ${Provider.of<FishModel>(context).number}'),
        Text('생선 사이즈: ${Provider.of<FishModel>(context).size}'),
        SizedBox(height:30),
        Middle(),
      ],
    );
  }
}
class SpicyB extends StatelessWidget {
  const SpicyB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('참치번호: ${Provider.of<SeaFishModel>(context).tunaNumber}'),
        Text('참치 사이즈: ${Provider.of<SeaFishModel>(context).size}') ,
        ElevatedButton(
          onPressed: (){
            Provider.of<SeaFishModel>(context, listen: false).changeSeaFishNumber();
          },
          child: Text('Sea fish Number'),
        ),
        SizedBox(height:30),
        Low(),
      ],
    );
  }
}

class SpicyC extends StatelessWidget {
  const SpicyC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('생선번호: ${Provider.of<FishModel>(context).number}'),
        Text('생선 사이즈: ${Provider.of<FishModel>(context).size}'),
        ElevatedButton(
          onPressed: (){Provider.of<FishModel>(context, listen: false).changeFishNumber();},
          child: Text('Next FishNo ${Provider.of<FishModel>(context).number}'),
        )
      ],
    );
  }
}

