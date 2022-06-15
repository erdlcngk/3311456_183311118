import 'package:saglikliyasam/models/todo_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiHelper {

  static Future<List<TodoModel>> getTodoListFromAPI() async {
    List<TodoModel> todoList = [];
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      //print("API"+body.toString());
      for(var todo in body){
        todoList.add(
          TodoModel(id: todo["id"], title: todo["title"], completed: todo["completed"].toString())
        );
      }
      return todoList;
    }
    else {
      throw Exception('Unexpected error occured!');
    }
  }

}