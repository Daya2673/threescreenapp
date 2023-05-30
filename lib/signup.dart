import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:threescreenapp/home.dart';
class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  final TextEditingController email =TextEditingController();
  final TextEditingController password=TextEditingController();
  Future signup() async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text.trim(), password: password.text.trim(),);
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SIGN UP',style: TextStyle(color: Colors.black),),centerTitle: true,backgroundColor: Colors.white,
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
                      hintText: 'Enter your email',
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
                      hintText: 'Enter new password',
                      prefixIcon: Icon(Icons.visibility),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)

                      ),
                    ),
                  ),
                  SizedBox(height: 30,),


                  SizedBox(height: 30,),
                  TextButton(
                    style:TextButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed:(){
                      signup().then((value) => Navigator.push(context ,MaterialPageRoute(builder: (context)=>home())));
                    } ,child: Text('SIGNUP',style: TextStyle(color: Colors.black),),),
                ],
              ),
            )
        )
    );
  }
}
