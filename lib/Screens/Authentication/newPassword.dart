import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Constants/controllers.dart';
import '../../Styles/colors.dart';
import '../../Widgets/button.dart';
import '../../Widgets/myText.dart';
import '../../Widgets/textField.dart';
import 'loginPage.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: white,
            body: SingleChildScrollView(
                child: Center(
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: Column(children: [
                          myText(
                              text: 'Create New Password',
                              color: textColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w700),
                          const SizedBox(height: 32),
                          passwordTextField(
                              title: 'Password',
                              hint: 'enter password',
                              controller: passwordController),
                          const SizedBox(height: 16),
                          passwordTextField(
                              title: 'Confirm Password',
                              hint: 'enter password',
                              controller: confirmPasswordController),
                          const SizedBox(height: 24),
                          customButton(
                              context: context,
                              text: 'Continue',
                              tap: (() {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => LoginPage()));
                              })),
                        ]))))));
  }
}
