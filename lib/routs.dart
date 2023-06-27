
import 'package:flutter/widgets.dart';
import 'package:libvary_app/View/forget_password_screen/forget_password_screen.dart';
import 'package:libvary_app/View/sign_in_screen/sign_in_screen.dart';
import 'package:libvary_app/View/welcome_screen/welcome_screen.dart';

final Map<String , WidgetBuilder> routes ={
  WelcomeScreen.routeName : (context) => WelcomeScreen(),
  SignInScreen.routeName : (context) => SignInScreen(),
  ForgetPasswordScreen.routeName : (context) => ForgetPasswordScreen(),
};