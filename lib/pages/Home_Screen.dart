import'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/components/ToDo_Tile.dart';
import 'package:to_do_app/components/showBox.dart';
import 'package:to_do_app/database/hive_database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _mydatabase = Hive.box('mybox');
  Database db= Database();
  @override
  void initState() {
    super.initState();
    if(_mydatabase.get('toDoList')==null)
      {
        db.initialData();
      }
    else
      {
        db.loadData();
      }
  }

  TextEditingController nameController= TextEditingController();
  TextEditingController nameEditController= TextEditingController();
  void showBox()
  {
    showDialog(
        context: context,
        builder: (context)=> ShowBox(controller: nameController, onPressed: saveToDo)
    );

  }

  void saveToDo()
  {
    if(nameController.text.isNotEmpty)
    {
      db.toDoList.add([nameController.text,false]);
    }
    setState(() {
      db.upDataData();
    });

    Navigator.pop(context);

    clear();
  }

  void editSaveToDo(int index)
  {
    if(nameEditController.text.isNotEmpty)
    {
      db.toDoList[index][0]=nameEditController.text;
    }
    setState(() {
      db.upDataData();
    });

    Navigator.pop(context);


    clear();
  }

  void deleteTask(int index)
  {
    setState(() {
      db.toDoList.removeAt(index);
      db.upDataData();
    });


  }

  void editTask(int index)
  {
    nameEditController.text=db.toDoList[index][0];
    showDialog(
        context: context,
        builder: (context)=>
            ShowBox(controller: nameEditController, onPressed: ()=>editSaveToDo(index))

    );
  }

  void clear()
  {
    nameController.clear();
  }
  void onClick(bool? isDone,int index)
  {
    setState(() {
      db.toDoList[index][1]=!db.toDoList[index][1];
    });
    db.upDataData();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
       title:const Text("TO DO"),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context,index)
              {
                return ToDoTile(
                  taskName: db.toDoList[index][0],
                  isDone: db.toDoList[index][1],
                  onClick: (value)=> onClick(value, index),
                  deleteTask:(value)=>deleteTask(index) ,
                  editTask: (value)=>editTask(index),

                );
              }
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: showBox,
        backgroundColor: Colors.yellow,
        child:const Icon(Icons.add),
      ),
    );
  }
}
