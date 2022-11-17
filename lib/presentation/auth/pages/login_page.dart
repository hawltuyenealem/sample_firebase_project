
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sample_firebase_project/data/models/login_request.dart';
import 'package:sample_firebase_project/presentation/auth/blocs/auth_bloc.dart';
import 'package:sample_firebase_project/presentation/auth/pages/register_page.dart';

class LoginPage extends StatefulWidget{
  static const String routeName = "/loginPage";
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
            autovalidateMode: AutovalidateMode
                .onUserInteraction, //check for validation while typing
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Center(
                    child: Container(
                      width: 200,
                      height: 150,
                      child: SvgPicture.asset("assets/loginimage.svg"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                      onChanged: (value){
                        email = value;
                      },
                      decoration: const InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'Enter valid email id as abc@gmail.com'),
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextFormField(
                      onChanged: (value){
                        password = value;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter secure password'),
                    //validatePassword,        //Function to check validation
                  ),
                ),
                const SizedBox(height: 50,),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        BlocProvider.of<AuthBloc>(context).add(Login(
                            loginRequest: LoginRequest(
                              email: email,
                              password: password,
                            )));
                      } else {
                        // print("Not Validated");
                      }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('New user? ', ),
                      TextButton(
                          child: Text('Create Account'),
                          onPressed: () {
                            Navigator.push(context, new MaterialPageRoute(builder: (context)=> RegisterPage()));
                          }
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}