import 'package:delivery_app/Providers/authProvider.dart';
import 'package:delivery_app/colors.dart';
import 'package:delivery_app/register.dart';
import 'package:delivery_app/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Shared/constants.dart';

class Login extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // void updateEmail(BuildContext context, String email) {
  //   context.read(emailProvider).state = email;
  // }

  // void updatePassword(BuildContext context, String password) {
  //   context.read(passwordProvider).state = password;
  // }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // final email = watch(emailProvider).state;
    // final password = watch(passwordProvider).state;
    final _auth = watch(authServicesProvider);

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
                  text: 'Login',
                  height: 1.1,
                  size: 42,
                ),
                PrimaryText(
                  text: 'Login now to browse our application',
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
                      TextFormField(
                        controller: emailController,
                        validator: (val) =>
                            val.isEmpty ? 'Enter your e-mail' : null,
                        decoration: textInputDecoration.copyWith(
                          hintText: 'Email',
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.tertiary,
                              width: 2.0,
                            ),
                          ),
                        ),
                        // onChanged: (val) => updateEmail(context, val),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: passwordController,
                        validator: (val) =>
                            val.isEmpty ? 'Enter your password' : null,
                        decoration: textInputDecoration.copyWith(
                          hintText: 'Password',
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.tertiary,
                              width: 2.0,
                            ),
                          ),
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
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              _auth.signIn(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PrimaryText(
                                text: 'Login',
                                fontWeight: FontWeight.w600,
                                size: 18,
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
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
                            'Don\'t have an account?',
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()));
                            },
                            child: Text(
                              'Register now',
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
