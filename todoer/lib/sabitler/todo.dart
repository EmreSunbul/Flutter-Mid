import 'package:flutter/material.dart';
import 'package:todoer/constants/tasktype.dart';
import 'package:todoer/model/task.dart';

class ToDoItem extends StatefulWidget {
  const ToDoItem({super.key,required this.task});
   final Task task;
  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
     bool isChecked =false;
  @override
  Widget build(BuildContext context) {
     return Card(
      color: widget.task.isCompleted ? Colors.grey : Colors.white,
                          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)) ,
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //ternary ops
                               widget.task.type==TaskType.note
                               ? Image.asset("lib/assets/Category.png") 
                               : widget.task.type == TaskType.contest  ? Image.asset("lib/assets/Category2.png") : Image.asset("lib/assets/Category3.png"), 
                                 Expanded(
                                   child: Column(
                                    children: [
                                      Text(widget.task.title,style:   TextStyle(fontWeight: FontWeight.bold,fontSize: 18,decoration: widget.task.isCompleted ?   TextDecoration.lineThrough :TextDecoration.none),),
                                      Text(widget.task.description,style: TextStyle(decoration: widget.task.isCompleted ?   TextDecoration.lineThrough :TextDecoration.none),)
                                    ],
                                   ),
                                 ) ,
                                  Checkbox(value: isChecked, onChanged: (val) => {
                                    setState(() {
                                      widget.task.isCompleted = !widget.task.isCompleted;
                                      isChecked=val!;
                                    })
                                  })
                              ],
                            ),
                          ),
                        );
  }
}