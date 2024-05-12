// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:task_manager/styles/styles.dart';
//
// class EmailVerificationScreen extends StatefulWidget {
//   const EmailVerificationScreen({super.key});
//
//   @override
//   State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
// }
//
// class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
//
//   TextEditingController _EmailEditingController = TextEditingController();
//
//
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//
//   final emailRegex =
//   RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           ScreenBackground(context),
//           Form(
//             key: _formKey,
//             child: Container(
//                 padding: EdgeInsets.symmetric(vertical: 30, horizontal: 90),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(right: 200.0),
//                       child: Text("Your Email Address", style: HeadText1(deepTeal, 20)),
//                     ),
//                     const SizedBox(
//                       height: 8,
//                     ),
//                     TextFormField(
//                       controller: _EmailEditingController,
//                       keyboardType: TextInputType.text,
//                       style: const TextStyle(
//                         fontSize: 18,
//                       ),
//                       decoration:
//                       textField("Enter your email", "example@gmail.com"),
//
//                       validator: (String? value) {
//                         if (value?.isEmpty ?? true) {
//                           return 'Enter your email';
//                         } else if (!emailRegex.hasMatch(value!)) {
//                           return 'Invalid email format';
//                         }
//                         return null;
//                       },
//                     ),
//
//                     const SizedBox(
//                       height: 16,
//                     ),
//                     Row(
//                       children: [
//                         ElevatedButton.icon(
//                           style: button(
//                             const Size(100, 40),
//                           ),
//                           onPressed: () { if(!_formKey.currentState!.validate()){
//                             return;
//                           }},
//                           icon: const Icon(Icons.login_rounded,
//                               color: Colors.white),
//                           label: Text("Sign In", style: HeadText1(white, 15)),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                           child: forgotPass(),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text(
//                           "Don't have an account?",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w500, letterSpacing: 0.5),
//                         ),
//                         TextButton(
//                             onPressed: () {
//                               Get.to(const RegistrationScreen());
//                             },
//                             child: const Text('Sign up')),
//                       ],
//                     )
//                   ],
//                 )),
//           ),
//         ],
//       ),
//     );
//   }
// }
