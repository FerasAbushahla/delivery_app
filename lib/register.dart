import 'package:delivery_app/Providers/authProvider.dart';
import 'package:delivery_app/Shared/constants.dart';
import 'package:delivery_app/colors.dart';
import 'package:delivery_app/login.dart';
import 'package:delivery_app/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Register extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // void updateName(BuildContext context, String email) {
  //   context.read(registerNameProvider).state = email;
  // }

  // void updateEmail(BuildContext context, String email) {
  //   context.read(registerEmailProvider).state = email;
  // }

  // void updatePhone(BuildContext context, String email) {
  //   context.read(registerPhoneProvider).state = email;
  // }

  // void updatePassword(BuildContext context, String password) {
  //   context.read(registerPasswordProvider).state = password;
  // }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // final name = watch(registerNameProvider).state;
    // final email = watch(registerEmailProvider).state;
    // final phone = watch(registerPhoneProvider).state;
    // final password = watch(registerPasswordProvider).state;
    final _auth = watch(authServicesProvider);
    // final uId = watch(registeruIdProvider).state;

    // UserModel userModel = UserModel(
    //   name: name,
    //   email: email,
    //   phone: phone,
    //   uId: uId,
    // );

    // FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(uId)
    //     .set(userModel.toMap());

    return Scaffold(
      backgroundColor: AppColors.white,
      // appBar: AppBar(
      //   elevation: 0,
      // ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryText(
                  text: 'Register',
                  height: 1.1,
                  size: 42,
                ),
                PrimaryText(
                  text: 'Register now to browse our application',
                  size: 18,
                  color: AppColors.lightGray,
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // TextFormField(
                      //   validator: (val) =>
                      //       val.isEmpty ? 'Enter your name' : null,
                      //   decoration: textInputDecoration.copyWith(
                      //     hintText: 'Name',
                      //   ),
                      //   onChanged: (val) => updateName(context, val),
                      // ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: emailController,
                        validator: (val) =>
                            val.isEmpty ? 'Enter your e-mail' : null,
                        decoration: textInputDecoration.copyWith(
                          hintText: 'Email',
                        ),
                        // onChanged: (val) => updateEmail(context, val),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // TextFormField(
                      //   validator: (val) =>
                      //       val.isEmpty ? 'Enter your phone number' : null,
                      //   decoration: textInputDecoration.copyWith(
                      //     hintText: 'Phone number',
                      //   ),
                      //   onChanged: (val) => updatePhone(context, val),
                      // ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: passwordController,
                        validator: (val) =>
                            val.isEmpty ? 'Enter a password' : null,
                        decoration: textInputDecoration.copyWith(
                          hintText: 'Password',
                        ),
                        obscureText: true,
                        // onChanged: (val) => updatePassword(context, val),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                            minWidth: MediaQuery.of(context).size.width - 40),
                        child: ElevatedButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            if (_formKey.currentState.validate())
                              _auth.signUp(
                                  email: emailController.text,
                                  password: passwordController.text);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PrimaryText(
                                text: 'Register',
                                fontWeight: FontWeight.w600,
                                size: 18,
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(10.0)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 20),
                              textStyle: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            'already have an account?',
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(color: AppColors.tertiary),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
