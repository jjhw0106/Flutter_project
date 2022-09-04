import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:TodoListPage(),
    );
  }
}

// class Todo
class Todo {
  bool isDone = false;
  String title;

  Todo(this.title);
}

// TodoListPage stful
class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {

  final _items = <Todo>[];

  var _todoController = TextEditingController();

  @override
  void dispose() {
    _todoController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              children:[
                Expanded(
                  child: TextField(
                    controller: _todoController,
                  ),
                ),
                ElevatedButton(
                    onPressed: (){
                      _addTodo(Todo(_todoController.text));
                    },
                    child: Text('추가'),
                ),
              ],
            ),
            Expanded(
                child: ListView(
                children: _items.map((todo)=>_buildItemWidget(todo)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildItemWidget(Todo todo){
    return ListTile(
      onTap: () => _toggleTodo(todo),
      title: Text(
        todo.title,
        style: todo.isDone
          ? TextStyle(
          decoration: TextDecoration.lineThrough,
          fontStyle: FontStyle.italic,
        ) : null,
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete_forever),
        onPressed: () => _deleteTodo(todo),
      ),
    );
  }
  void _addTodo(Todo todo){
    setState(() {
      _items.add(todo);
      _todoController.text = '';
    });
  }
  void _deleteTodo(Todo todo){
    setState((){
      _items.remove(todo);
    });
  }
  void _toggleTodo(Todo todo) {
    setState(() {
      todo.isDone=!todo.isDone;
    });
  }
}

//
// TodoListPageState State<TodoListPage>