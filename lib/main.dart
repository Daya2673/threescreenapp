import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:threescreenapp/signup.dart';
import 'package:threescreenapp/login.dart';
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  final TextEditingController email =TextEditingController();
  final TextEditingController password=TextEditingController();
  Future signin() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text.trim(), password: password.text.trim(),);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('LOGIN',style: TextStyle(color: Colors.black),),
          centerTitle: true,backgroundColor: Colors.white,
        ),
        body:
        Container(
            decoration: BoxDecoration(image: DecorationImage(
              image: AssetImage('images/login.jpg'),
              fit: BoxFit.cover,

            ),

            ) ,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: email,
                    decoration: InputDecoration(
                      fillColor: Colors.cyan,
                      filled: true,
                      hintText: 'email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),


                      ),

                    ),
                  ),
                  SizedBox(height: 30,),

                  TextField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: Colors.cyan,
                      filled: true,
                      hintText: 'password',

                      prefixIcon: Icon(Icons.visibility),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)

                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  TextButton(
                    style:TextButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed:(){
                      signin().then((value) => Navigator.push(context ,
                          MaterialPageRoute(builder: (context)=>signup())));
                    } ,child: Text('LOGIN',style: TextStyle(color: Colors.black),),),
                ],
              ),
            )
        )
    );
  }
}
