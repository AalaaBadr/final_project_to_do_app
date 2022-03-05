import 'package:flutter/material.dart';
import 'package:final_project_to_do_app/connection/Login_page.dart';
import 'package:final_project_to_do_app/connection/Signup_page.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.black12,
        appBar:AppBar(
          backgroundColor: Color(0xff2a2e3d),
          title: const Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ),
        body: SafeArea (
            child: Center(
                child: Column (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            padding: const EdgeInsets.all(12),
                          ),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                          },
                          child:  Text('Log in',
                              style: TextStyle(fontSize: 40 ,color: Colors.black)
                          ),

                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              padding: const EdgeInsets.all(12),
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                            },
                            child:  Text('Sign up',
                                style: TextStyle(fontSize: 40 ,color: Colors.black)
                            )
                        ),
                      ),
                      Spacer()
                    ]
                )
            )
        )
    );
  }
}