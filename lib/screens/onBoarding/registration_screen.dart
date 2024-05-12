import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/screens/onBoarding/login_screen.dart';
import 'package:task_manager/styles/styles.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final emailRegex =
  RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  final hasNumberRegex = RegExp(r'[0-9]');

  bool _isObscure = true;

  bool _signUpInProgress = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPasswordTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 90),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 80.0),
                      child: Text("Join with us", style: HeadText1(deepTeal, 40)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _emailTEController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      decoration: textField("Enter your email", "example@gmail.com"),
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter your email';
                        } else if (!emailRegex.hasMatch(value!)) {
                          return 'Invalid email format';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _firstNameTEController,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      decoration: textField("Enter your first name", "John"),
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter your first name';
                        } else if (hasNumberRegex.hasMatch(value!)) {
                          return 'No numbers allowed in name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _lastNameTEController,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      decoration: textField("Enter your last name", "Doe"),
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter your first name';
                        } else if (hasNumberRegex.hasMatch(value!)) {
                          return 'No numbers allowed in name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _mobileTEController,
                      keyboardType: TextInputType.phone,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      decoration: textField("Mobile", "+880*****"),
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter your phone number';
                        } else if (value!.length <= 10) {
                          return 'Phone number must be 11 characters long';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _passwordTEController,
                      style: const TextStyle(fontSize: 18),
                      obscureText: _isObscure,
                      decoration: passwordField(
                        "Enter password",
                        IconButton(
                          icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                      validator: (String? value) {
                        if ((value?.isEmpty ?? true) || value!.length < 8) {
                          return 'Enter password correctly with minimum 8 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _confirmPasswordTEController,
                      style: const TextStyle(fontSize: 18),
                      obscureText: _isObscure,
                      decoration: passwordField(
                        "Confirm password",
                        IconButton(
                          icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                      validator: (String? value) {
                        if (value != _passwordTEController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Visibility(
                          visible: _signUpInProgress == false,
                          replacement: Center(child: CircularProgressIndicator()), // Show CircularProgressIndicator if sign-up is in progress
                          child: ElevatedButton.icon(
                            style: button(const Size(328, 40)),
                            onPressed: () {
                              if(!_formKey.currentState!.validate()){
                                return;
                              }
                              // Start sign-up process
                              // Set _signUpInProgress to true
                            },
                            icon: const Icon(Icons.app_registration, color: Colors.white),
                            label: Text("Register", style: HeadText1(white, 15)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(fontWeight: FontWeight.w500, letterSpacing: 0.5),
                        ),
                        TextButton(
                          onPressed: () {Get.to(const LoginScreen());},
                          child: const Text('Sign in'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
