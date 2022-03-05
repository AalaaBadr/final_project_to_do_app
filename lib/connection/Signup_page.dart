import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_to_do_app/screen/ToDoMain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  String validValue = '';
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Sign up',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),

        ),
        body: Form(
            key: formKey,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: emailController,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.emailAddress,

                        validator: (value) {
                          if (value!.contains('@') && value.contains('.')) {
                            validValue = 'Ok';
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'email',
                          hintStyle: const TextStyle(color: Colors.black54),
                        ),
                      ),
                      const SizedBox(height: 10),

                      TextFormField(
                        controller: passwordController,
                        textAlign: TextAlign.start,
                        obscureText: true,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (_) {},
                        validator: (value) {
                          if (value!.isEmpty || value.length < 6) {
                            return 'Invalid password';
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'password',
                          hintStyle: const TextStyle(color: Colors.black54),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            padding: const EdgeInsets.all(12),
                          ),
                          onPressed: () async {

                            final message = await signup();
                            if (formKey.currentState!.validate()) {
                              if (message != 'Ok') {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(content: Text(
                                    message)));
                              }
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (
                                  context) => ToDoMain(title: "",x: 0,)));
                            }
                          },
                          child:
                          const Text('Sign up', style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600, color: Colors.white),
                          ),



                        ),
                      ),
                    ]
                )
            )
        )
    );
  }
  Future<String> signup() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      CollectionReference users = firestore.collection('users');
      return 'Ok';
    } on FirebaseAuthException catch (e) {
      print(e);
      var errorMessage = 'Authentication failed';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        errorMessage = 'Wrong password provided for that user.';
      } else if (e.code == 'email-already-in-use') {
        print('email is already exist.');
        errorMessage = 'email is already exist.';
      }
      return errorMessage;
    }
  }
}

