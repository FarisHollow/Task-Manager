import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager/styles/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool _isObscure = true;

  TextEditingController _EmailEditingController = TextEditingController();
  TextEditingController _PassTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 90),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/logo.svg",
                  height: 180,
                  width: 180,

                ),

                const SizedBox(height: 30,),


                Text("Get started",
                 style:  TextStyle(
                  fontFamily: "poppins",
                   fontSize: 18, // Adjust font size as needed
                   fontWeight: FontWeight.w700, // Adjust font weight as needed
                   color: Colors.black,



                ),),

                const SizedBox(height: 8,),


                TextFormField(  controller: _EmailEditingController,
                  style: TextStyle(fontSize: 18,),
                  decoration: InputDecoration(
                      labelText: "Enter your name:",
                      hintText: "John Doe",
                      filled: true,
                      fillColor: Colors.grey.shade200,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal, width: 1)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade200, width: 0.0)
                    ),


                  ),
                ),

                const SizedBox(height: 8,),



            TextFormField(
            controller: _PassTextEditingController,
            style: TextStyle(fontSize: 18),
            obscureText: _isObscure,
            decoration: InputDecoration(
              labelText: "Enter password:",
              filled: true,
              fillColor: Colors.grey.shade200,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.teal, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade200, width: 0.0),
              ),
              suffixIcon: IconButton(
                icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              ),
            ),
          )




        ],
            )
          ),
        ],

      ),
    );
  }
}
