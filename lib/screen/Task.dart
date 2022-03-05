import 'package:final_project_to_do_app/screen/ToDoMain.dart';
import 'package:final_project_to_do_app/screen/TodoCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Task extends StatefulWidget {

   Task({Key? key }) : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController title = TextEditingController();
  int? x ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
            'Your Task',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),

      ),

        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black87,
            items:[
              BottomNavigationBarItem(
                icon: Container(
                      height: 56,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors:[ Color(0xff8a32f1),
                                  Color(0xffad32f9),
                        ]
                        )
                      ),
                      child: Center(
                              child: InkWell(
                                child: Text('Add Task',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff2a2e3d),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ToDoMain(title: (title.text).toString(),x: x,)));


                                 }
                              ),
                            ),
                          ),
                   label: '',
                 )
                   ]
              ),


      body:
      Container(
        decoration:BoxDecoration(
          color: Colors.black87
        ),
        child: Form(
          key: formKey,
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:20,vertical: 5),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
              Text(
                'Task Title',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                )
              ),
                const SizedBox(height: 15),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                decoration:BoxDecoration(
                color: Colors.deepPurple[600],
                borderRadius:BorderRadius.circular(15),
                ),
                child: TextFormField(
                  controller: title,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                style: TextStyle(
                   color: Colors.grey,
                   fontWeight: FontWeight.bold,
                   fontSize:22,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                hintText: 'Enter Title',
                hintStyle: TextStyle(
                 color: Colors.grey),
                  contentPadding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 10,
                    top: 10,
                  ),
                  ),
                  ),
              ),
                 const SizedBox(height: 30),

                Text(
                    'Task Type',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    )
                ),
                const SizedBox(height: 15),
                Wrap(
                  children: [
                    InkWell(
                      child: Container(
                        height: 50,
                        width:  50,
                        decoration: BoxDecoration(
                          color: x==1 ? Colors.black :Color(0xff2a2e3d) ,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Icon(
                            Icons.alarm,
                            color: Colors.red,
                            size: 35,
                        ),
                      ),
                      onTap:()
                      { setState(() {
                        x=1;
                      });

                      } ,
                    ),
                    const SizedBox(width: 10),

                    InkWell(
                      child: Container(
                        height: 50,
                        width:  50,
                        decoration: BoxDecoration(
                          color: x==2 ? Colors.black : Color(0xff2a2e3d) ,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Icon(
                            Icons.audiotrack,
                            size: 35,
                          color: Colors.pinkAccent,
                        ),
                      ),
                      onTap:()
                      {
                        setState(() {
                          x=2;
                        });

                      } ,
                    ),
                    const SizedBox(width: 10),

                    InkWell(
                      child: Container(
                        height: 50,
                        width:  50,
                        decoration: BoxDecoration(
                          color: x==3 ? Colors.black :Color(0xff2a2e3d) ,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Icon(
                            Icons.shopping_cart,
                            color: Colors.orange,
                            size: 35,
                        ),
                      ),
                      onTap:()
                      {
                        setState(() {
                          x=3;
                        });

                      } ,
                    ),
                    const SizedBox(width: 10),

                    InkWell(
                      child: Container(
                        height: 50,
                        width:  50,
                        decoration: BoxDecoration(
                          color: x==4 ? Colors.black :Color(0xff2a2e3d) ,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Icon(
                            Icons.run_circle,
                            color: Colors.blue,
                            size: 35,
                        ),
                      ),
                      onTap:()
                      {
                        setState(() {
                          x=4;
                        });

                      } ,
                    ),
                    const SizedBox(width: 10),

                    InkWell(
                      child: Container(
                        height: 50,
                        width:  50,
                        decoration: BoxDecoration(
                          color: x==5 ? Colors.black :Color(0xff2a2e3d) ,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Icon(
                          Icons.book_rounded,
                          color: Colors.green,
                          size: 35,
                        ),
                      ),
                      onTap:()
                      {
                        setState(() {
                          x=5;
                        });

                      } ,
                    ),
                    const SizedBox(width: 10),

                    InkWell(
                      child: Container(
                        height: 50,
                        width:  50,
                        decoration: BoxDecoration(
                          color: x==6 ? Colors.black :Color(0xff2a2e3d) ,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Icon(
                          Icons.work,
                          color: Colors.amber,
                          size: 35,
                        ),
                      ),
                      onTap: ()
                      {
                        setState(() {
                          x=6;
                        });

                      }
                    ),
                    const SizedBox(width: 10),

                  ],

                ),

                const SizedBox(height: 30),
                Text(
                    'Task Description',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    )
                ),
                const SizedBox(height: 15),
               Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    decoration:BoxDecoration(
                      color: Colors.deepPurple[600],
                      borderRadius:  BorderRadius.circular(15),

                    ),
                    child: TextFormField(
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize:20,
                      ),
                      maxLines: null,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Description',
                        hintStyle: TextStyle(
                            color: Colors.grey),
                        contentPadding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          bottom: 10,
                          top: 10,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 30),


         ]
         ),
            ),
          )
        )
        ),
      )
    );
  }
}
