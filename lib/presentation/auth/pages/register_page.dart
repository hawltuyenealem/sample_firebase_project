
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sample_firebase_project/data/models/sign_up_request.dart';
import 'package:sample_firebase_project/presentation/auth/blocs/auth_bloc.dart';
import 'package:sample_firebase_project/presentation/auth/pages/login_page.dart';

class RegisterPage extends StatefulWidget{
  static const String routeName = "/registerPage";
  State<RegisterPage> createState() => _RegisterPageState();
}
class _RegisterPageState extends State<RegisterPage>{
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String firstName = '';
  String lastName = '';
  String email = '';
  String phoneNumber = '';
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
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextFormField(
                      onChanged: (value) {
                        firstName = value;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'First Name',
                          hintText: 'Enter valid Name'),
                     ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextFormField(
                      onChanged: (value) {
                        lastName = value;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Last Name',
                          hintText: 'Enter valid Name'),
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'Enter valid email id as abc@gmail.com'),
                     ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextFormField(
                      keyboardType: TextInputType.number,
                      keyboardAppearance: Brightness.dark,
                      onChanged: (value) {
                        phoneNumber = value;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ], // Only numbers can be entered
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Phone Number',
                          hintText: '0987654321'),
                     ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextFormField(
                      obscureText: true,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter secure password'),
                    //Function to check validation
                  ),
                ),
                BlocBuilder<AuthBloc, AuthState>(builder: (context, state){
                  if (state is AuthError){
                    return Center(child: Text(state.errorResponse.message,textAlign: TextAlign.center, style: const TextStyle(color: Colors.red),));
                  }
                  return Container();
                }),
                ElevatedButton(
                  onPressed: () {
                    //TODO FORGOT PASSWORD SCREEN GOES HERE
                  },
                  child: const Text(
                    'Forgot Password',
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
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
                        BlocProvider.of<AuthBloc>(context).add(Register(
                            signUpRequest: SignUpRequest(
                                firstName: firstName,
                                lastName: lastName,
                                email: email,
                                password: password,
                                phoneNumber: phoneNumber)));
                        print("Validated");
                      } else {
                        print("Not Validated");
                      }
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                InkWell(onTap: (){
                  Navigator.pushNamed(context, LoginPage.routeName);
                },child: const Text('Already have an account? Login',style: TextStyle(color: Colors.green),)),
                SizedBox(height: 100,),
              ],
            ),
          ),
        ),

    );
  }
}