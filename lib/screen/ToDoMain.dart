import 'package:flutter/material.dart';
import 'TodoCard.dart';
import 'package:final_project_to_do_app/screen/Task.dart';

class ToDoMain extends StatefulWidget {
  String? title;
  int? x;
   ToDoMain({Key? key,required this.title,required this.x}) : super(key: key);

  @override
  State<ToDoMain> createState() => _ToDoMainState();
}

class _ToDoMainState extends State<ToDoMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar:AppBar(
        backgroundColor: Colors.black87,
        title: Text(
              'To Do List',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
      ),
     bottomNavigationBar: BottomNavigationBar(
       backgroundColor: Colors.black87,
         items:[

       BottomNavigationBarItem(
           icon: Container(
             height :60,
             width:60,
               decoration: BoxDecoration(
                 shape: BoxShape.circle,
                 gradient: LinearGradient(
                   colors: [
                     Colors.indigoAccent,
                     Colors.purple,
                   ]
                 )
               ),
              child:InkWell(
                 child: Icon( Icons.note_add_sharp,
                   size: 32,
                   color: Colors.white,
             ),
                onTap: () {

               Navigator.push(
               context, MaterialPageRoute(
               builder: (context) => Task()));
                },
              ),
           ),
         label: '',
       ),

         ]
     ),
      body: SingleChildScrollView(
       child:Container(
       height: MediaQuery.of(context).size.height,
       width: MediaQuery.of(context).size.width,
         padding: EdgeInsets.symmetric(
             horizontal: 20,
             vertical: 20),
         child:  TodoCard(taskTitle: (widget.title).toString(),x: widget.x,) 


    )
      )
    );

  }
}
