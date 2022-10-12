import 'dart:developer';

import 'package:ecommerce/common/Utils/api_util.dart';
import 'package:ecommerce/common/common_text.dart';
import 'package:ecommerce/common/widgets/form_field/text_form_field.dart';
import 'package:ecommerce/model/login_request.dart';
import 'package:flutter/material.dart';

import '../../common/global.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final _formKey = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {
  String? _email;
  String? _password;
  bool _visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: Text(
                  titile.toLowerCase(),
                  style: TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: ListTile(
                  title: const Text(
                    welcomeUserText,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    enterAccountDetailsText,
                    style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
                  ),
                ),
              ),

              /// Email Address input
              CustomTextFormField(
                backgroundColor: Colors.grey.shade200,
                prefixIcon: const Icon(Icons.person),
                hintText: userHintText,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onChanged: (val) {
                  _email = val;
                },
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return userErrorText;
                  }
                  return null;
                },
              ),

              /// Password input
              CustomTextFormField(
                backgroundColor: Colors.grey.shade200,
                obscureText: _visiblePassword,
                hintText: enterPasswordText,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
                onChanged: (val) {
                  _password = val;
                },
                validator: (password) {
                  if (password == null || password.length == 0) {
                    return emptyPasswordText;
                  }
                  return null;
                },
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      _visiblePassword = !_visiblePassword;
                    });
                  },
                  child: Icon(
                    _visiblePassword ? Icons.visibility_off : Icons.visibility,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: ElevatedButton(
              child: const Text(loginText),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontStyle: FontStyle.normal),
              ),
              onPressed: loginValidation),
        ),
      ),
    );
  }

  loginValidation() {
    if (_formKey.currentState!.validate()) {
      loginUser();
    }
  }

  void loginUser() async {
    ApiUtil api = ApiUtilWrapper();

    final commonResponse = await api
        .loginUser(LoginRequest(phoneNo: _email!, password: _password!));
    if (commonResponse.accessToken != null) {
      print(commonResponse.accessToken);
      Global.getInstance().token = commonResponse.accessToken!;
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, '/sweepsTakesList');
    }
  }
}
