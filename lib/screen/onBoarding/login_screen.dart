import 'package:flutter/material.dart';
import 'package:task_manager/api/apiClient.dart';

import '../../style/style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Map<String, String> FormValues = {
    "email": "",
    "password": "",
  };

  bool Loading = false;

  InputOnChange(MapKey, Textvalue) {
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async {
    if (FormValues['email']!.length == 0) {
      ErrorToast('Email Required!');
    } else if (FormValues['password']!.length == 0) {
      ErrorToast('Password Required!');
    } else {
      setState(() {
        Loading = true;
      });

      bool res = await LoginRequest(FormValues);

      if (res == true) {

          Navigator.pushNamedAndRemoveUntil(
            context, '/newTask', (route) => false,);

        setState(() {
          Loading = false;
        });
      } else {
        setState(() {
          Loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        ScreenBackground(context),
        Container(
          alignment: Alignment.center,
          child: Loading ? const Center(child: CircularProgressIndicator(),) : SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Get Started With",
                    style: Head1Text(colorDarkBlue),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    "Learn with Rabbil hasan",
                    style: Head6Text(colorLightGray),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                      onChanged: (Textvalue) {
                        InputOnChange("email", Textvalue);
                      },
                      decoration: AppInputDecoration("Email"),),
                  const SizedBox(height: 20),
                  TextFormField(
                      onChanged: (Textvalue) {
                        InputOnChange("password", Textvalue);
                      },
                      decoration: AppInputDecoration("Password"),),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: AppButtonStyle(),
                    child: SuccessButtonChild('Login'),
                    onPressed: () {
                      FormOnSubmit();
                    },
                  ),
                  const SizedBox(height: 20),
                ]),
          )
        ),
      ]),
    );
  }
}
