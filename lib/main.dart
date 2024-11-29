import 'package:flutter/material.dart';
import 'package:task_manager/screen/onBoarding/email_verification_screen.dart';
import 'package:task_manager/screen/onBoarding/login_screen.dart';
import 'package:task_manager/screen/onBoarding/pin_verification_screen.dart';
import 'package:task_manager/screen/onBoarding/reg_screen.dart';
import 'package:task_manager/screen/onBoarding/set_password_screen.dart';
import 'package:task_manager/screen/onBoarding/splash_screen.dart';
import 'package:task_manager/screen/task/new_task_list_screen.dart';

void main(){
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      initialRoute: '/login',
      routes: {
        '/splash' : (context) => const SplashScreen(),
        '/login' : (context) => const LoginScreen(),
        '/registration' : (context) => const RegistrationScreen(),
        '/email' : (context) => const EmailVerificationScreen(),
        '/pin' : (context) => const PinVerificationScreen(),
        '/password' : (context) => const SetPasswordScreen(),
        '/newTask' : (context) => const NewTaskListScreen(),
      },
    );
  }
}
