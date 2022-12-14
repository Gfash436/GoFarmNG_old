import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gofarmng/Constants/size_config.dart';
import 'package:gofarmng/Provider/AuthProvider/authProvider.dart';
import 'package:gofarmng/Screens/Authentication/forgotPassword.dart';
import 'package:gofarmng/Utilities/snack_messages.dart';
import 'package:gofarmng/Widgets/textField.dart';
import 'package:provider/provider.dart';

import '../../Styles/colors.dart';
import '../../Utilities/routers.dart';
import '../../Widgets/button.dart';
import '../../Widgets/myText.dart';
import 'signUpPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _loginEmailController = TextEditingController();
  final TextEditingController _loginPasswordController =
      TextEditingController();

  bool _checked = false;

  @override
  void dispose() {
    _loginEmailController.clear();
    _loginPasswordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
              child: Column(children: [
                myText(
                    text: 'Sign In',
                    color: textColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
                const SizedBox(height: 32),
                customTextField(
                    title: 'Email Address',
                    hint: 'example@gmail.com',
                    controller: _loginEmailController,
                    keyboardType: TextInputType.emailAddress),
                const SizedBox(height: 16),
                passwordTextField(
                    title: 'Password',
                    hint: 'enter password',
                    controller: _loginPasswordController),
                Row(children: [
                  Checkbox(
                    value: _checked,
                    onChanged: (
                      bool? value,
                    ) {
                      setState(() {
                        _checked = !_checked;
                      });
                    },
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(280),
                    child: Row(
                      children: [
                        myText(
                            text: 'Remember me',
                            color: grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) =>
                                        const ForgotPassword()));
                          },
                          child: myText(
                              pressed: () {
                                PageNavigator(ctx: context)
                                    .nextPage(page: const ForgotPassword());
                              },
                              text: 'Forgot Password',
                              color: green,
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  )
                ]),
                const SizedBox(height: 24),
                Consumer<AuthenticationProvider>(
                    builder: (context, auth, snapshot) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (auth.resMessage != "") {
                      showMessage(message: auth.resMessage, context: context);

                      //clear the response message to avoide duplicate
                      auth.clear();
                    }
                  });
                  return customButton(
                      context: context,
                      text: 'Sign In',
                      tap: (() {
                        auth.LoginUser(
                            email: _loginEmailController.text.trim(),
                            password: _loginPasswordController.text,
                            context: context);
                        // }
                      }));
                }),
                const SizedBox(height: 24),
                SizedBox(
                  width: getProportionateScreenWidth(300),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Divider(
                        thickness: 1,
                        color: grey,
                      )),
                      myText(
                          text: ' or ',
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      Expanded(
                        child: Divider(
                          color: grey,
                          thickness: 1,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                googleButton(
                  tap: (() {
                    // auth.signIn(context);
                  }),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const myText(
                      text: "Don't have an account? ",
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    GestureDetector(
                      onTap: () {
                        PageNavigator(ctx: context)
                            .nextPage(page: const SignUpPage());
                      },
                      child: myText(
                          text: 'Sign Up.',
                          color: green,
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
