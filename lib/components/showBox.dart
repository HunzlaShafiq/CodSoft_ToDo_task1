import 'package:flutter/material.dart';
class ShowBox extends StatelessWidget {
  TextEditingController controller;
  VoidCallback onPressed;
  ShowBox({super.key, required this.controller,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
          backgroundColor: Colors.yellow[300],

          title: const Text('Add To DO'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "Task",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.black26)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.black26)
                    ),
                  )
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: onPressed,
              child:const Text('ADD',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child:const Text('Cancel',
                style: TextStyle(color: Colors.black),),
            )
          ],
        );
  }
}
