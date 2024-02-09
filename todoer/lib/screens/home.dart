import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todoer/constants/colors.dart';
import 'package:todoer/constants/tasktype.dart';
import 'package:todoer/model/task.dart';
import 'package:todoer/screens/add_new_task.dart';
import 'package:todoer/sabitler/todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 //List<String> todo=["Study Lessons","Run 5K","Go to Party","Run 5K","Go to Party","Run 5K","Go to Party"];

 //List<String>completed=["yes","no","no","no","no","no","no","no"];

List<Task> todo=[
 Task(type: TaskType.note, title: "Study Lessons", description: "Study Time", isCompleted: false),
 Task(type: TaskType.calendar, title: "Run 5K", description: "Study Time", isCompleted: false),
 Task(type: TaskType.contest, title: "Go to Party", description: "Study Time", isCompleted: false)
];
List<Task> completed=[
 Task(type: TaskType.calendar, title: "Run 5K", description: "Study Time", isCompleted: false),
 Task(type: TaskType.contest, title: "Go to Party", description: "Study Time", isCompleted: false)
];

void addNewTask(Task newTask){
setState(() {
  todo.add(newTask);

});

}
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      home:SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: Column(
            children: [
              Container(
                width:deviceWidth ,
                height:deviceHeight / 5,
                color:HexColor(headerColor),
                child: const Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: 20),
                      child: Text('october 20, 2024',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                    ),
                     Padding(
                       padding:  EdgeInsets.only(top: 40),
                       child: Text('ToDoEr',style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
                     ),
                  
                  
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: todo.length,
                      itemBuilder: (context, index) {
                          return   ToDoItem(task:todo[index],);
                       

                      } ,)
                  
                  ),
                ),
              ),
              
            const  Padding(
               padding:  EdgeInsets.only(left: 20),
               child: Align(
                  alignment: Alignment.centerLeft,
                  child:  Text(
                    'Completed',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                    ),
                ),
             ),
             Expanded(
               child: Padding(
                padding: const EdgeInsets.fromLTRB(20,10,20,10),
                child: SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: completed.length,
                    itemBuilder:(context, index) {
                      
                    return ToDoItem(task: completed[index]);
                  }, ),
                )
               ),
             ),
             ElevatedButton(onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) =>  AddNewTask(addNewTask: ((newTask) => addNewTask(newTask)))
                ),
              );
             }, child: const Text("Add New Task"))
            ],
          ),
        ),
      ), 
    );
  }
}