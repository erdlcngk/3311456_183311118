import 'package:flutter/material.dart';
import 'package:saglikliyasam/helpers/api_helper.dart';
import 'package:saglikliyasam/models/todo_model.dart';
import 'package:saglikliyasam/views/bottom_tabs/notes_page/new_note_page.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Notlar"),
      ),
      body: FutureBuilder<List<TodoModel>>(
          future: ApiHelper.getTodoListFromAPI(),
          builder: (BuildContext context, snapshot){
            if(snapshot.hasData)
            {
              List<TodoModel>? data=snapshot.data;
              return ListView.builder(
                  padding: EdgeInsets.only(top: 20),
                  itemCount: 5,
                  itemBuilder: (BuildContext context,int index){
                    return Column(
                      children: [
                        noteCard(data![index].title,data[index].completed),
                        Divider()
                      ],
                    );
                  });
            }
            return Center(child: CircularProgressIndicator(),);
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>NewNotePage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget noteCard(String note, String isCompleted){
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: CheckboxListTile(
        title: Text(note),
        onChanged: (value){

        },
        value: isCompleted == "true" ? true : false,
      )
    );
  }

}
