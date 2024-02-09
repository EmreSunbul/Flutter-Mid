import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todoer/constants/colors.dart';
import 'package:todoer/constants/tasktype.dart';
import 'package:todoer/model/task.dart';


class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key, required this.addNewTask});
  final void Function(Task newTask) addNewTask;

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
 TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
   TextEditingController timeController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

 TaskType  taskType = TaskType.note;
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(backgroundColor),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: deviceWidth,
                height: deviceHeight / 10,
                decoration: BoxDecoration(color: HexColor(headerColor)),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close,
                          size: 40, color: Colors.white),
                    ),
                    const Expanded(
                      child: Text(
                        'add new task',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 21),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text("Task Title"),
              ),
               Padding(
                padding:
                   const  EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Category"),
                GestureDetector(
                  onTap: () {
                 ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
             duration: Duration(milliseconds: 300),
            content: Text("Category Selected"),
                 ),
               );
                 setState(() {
                        taskType = TaskType.note;
                      });
                    },
              child: Image.asset("lib/assets/Category.png"),// Add a child widget here
               ),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            duration: Duration(milliseconds: 300),
                            content: Text("Category Selected")),
                      );
                      setState(() {
                        taskType = TaskType.calendar;
                      });
                    },
                    child: Image.asset("lib/assets/Category2.png"),
                  ),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            duration: Duration(milliseconds: 300),
                            content: Text("Category Selected")),
                      );
                        setState(() {
                        taskType = TaskType.contest;
                      });
                    },
                    child: Image.asset("lib/assets/Category3.png"),
                  ),
                ],
              ),
               Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                    const    Text("Date"),
                        Padding(
                          padding:  const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller: dateController,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                   Expanded(
                    child: Column(
                      children: [
                       const  Text("Time"),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller: timeController,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const Text("Notes"),
               SizedBox(
                height: 300,
                child: TextField(
                  controller: descriptionController,
                  expands: true,
                  maxLines: null,
                  decoration:  const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                  ),
                ),
              ),
              ElevatedButton(onPressed: (){
              Task newTask = Task(type: taskType, title: titleController.text, description: descriptionController.text, isCompleted: false
              );
              widget.addNewTask(newTask);
              Navigator.pop(context);
              }, 
              child: const Text("Save")
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}
