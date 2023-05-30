import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:threescreenapp/login.dart';
import 'package:threescreenapp/signup.dart';


class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('welcome',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        FirebaseAuth.instance.signOut().then((value) => Navigator.push(context, MaterialPageRoute(
            builder: (context)=>signup())));
      },
      child: Icon(Icons.logout),
      ),
    );
  }
}
