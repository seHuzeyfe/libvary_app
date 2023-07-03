import 'package:flutter/material.dart';
import '../../size_config.dart';
import 'components/forget_password_body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static String routeName = "/forget_password";
  const ForgetPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(75)),
            child: Text("Şifremi Unuttum")),
      ),
      body: Body(),
    );
  }
}
