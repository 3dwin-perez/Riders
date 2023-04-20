import 'package:flutter/material.dart';

import 'login.dart';
import 'register.dart';


class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration:const  BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.black,
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          title:const Text(
              "Welcome",
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontFamily: "Signatra",
            ),
          ),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.lock, color: Colors.red,),
                text: "Login",
              ),
              Tab(
                icon: Icon(Icons.lock, color: Colors.red,),
                text: "Register",
              ),
            ],
            indicatorColor: Colors.white,
            indicatorWeight: 6,
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.black,
                Colors.black,
              ]
            )
          ),
          child: TabBarView(
            children: [
              LoginScreen(),
              RegisterScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
