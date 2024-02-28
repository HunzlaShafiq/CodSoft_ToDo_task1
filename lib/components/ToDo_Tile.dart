import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  String taskName;
  bool isDone;
  Function(bool?) onClick;
  Function(BuildContext)?  deleteTask;
  Function(BuildContext)?  editTask;

   ToDoTile({super.key,
     required this.isDone,
     required this.taskName,
     required this.onClick,
     required this.deleteTask,
     required this.editTask
   });



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
              onPressed: editTask,
              icon: Icons.edit,
              backgroundColor: Colors.blueAccent,
                borderRadius: BorderRadius.circular(8),
            ),
              SlidableAction(
                  onPressed: deleteTask,
                icon: Icons.delete_rounded,
                backgroundColor: Colors.red,
                borderRadius: BorderRadius.circular(8),

              ),

            ]
        ),
        child: Container(
          padding:const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.yellow,
          ),
          child: Row(
            children: [
              Checkbox(
                value: isDone, onChanged:onClick,
                activeColor: Colors.black,
              ),
              Text(
                  taskName,
                style: TextStyle(
                  decoration: isDone? TextDecoration.lineThrough : TextDecoration.none
                ),
              ),

            ],
          ),

        ),
      ),
    );
  }
}


