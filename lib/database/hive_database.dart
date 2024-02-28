
import 'package:hive_flutter/hive_flutter.dart';

class Database{
  List toDoList =[
  ];
  final _mydatabase = Hive.box('mybox');

  void initialData ()
  {
    toDoList =[
      ["Coding",false],
      ["Eat",false],
      ["rest",true],

    ];
  }

  void loadData()
  {
    toDoList = _mydatabase.get('toDoList');
  }

  void upDataData()
  {
    _mydatabase.put('toDoList', toDoList);
  }


}