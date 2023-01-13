import 'package:flutter/material.dart';

class MultiSelect extends StatefulWidget {
  @override
  _MultiSelectState createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  final List<String> items = List.generate(20, (index) => 'Item $index');
  final List<String> _selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onLongPressMoveUpdate: (details) {
          print("check");
          final RenderBox item = context.findRenderObject() as RenderBox;
          final position = item.globalToLocal(details.globalPosition);
          final dy = position.dy;
          final index = (dy / item.size.height).floor();
          if (index < 0 || index >= items.length) return;
          setState(() {
            _selectedItems.add(items[index]);
          });
        },
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final isSelected = _selectedItems.contains(items[index]);
            return Container(
              decoration: BoxDecoration(
                color: isSelected ? Colors.black12 : null,
              ),
              child: ListTile(
                title: Text(items[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}