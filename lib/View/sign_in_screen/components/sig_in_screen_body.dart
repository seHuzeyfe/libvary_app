import 'package:flutter/material.dart';
import 'package:libvary_app/View/forget_password_screen/forget_password_screen.dart';
import 'package:libvary_app/constants.dart';
import 'package:libvary_app/size_config.dart';
import 'sign_in_screen_contents.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
           child: Padding(
            padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
               child: Column(
                 children: [
                   SizedBox(height: SizeConfig.screenHeight * 0.01),
                 Text(
                "Hoşgeldiniz",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(25),
                  fontWeight: FontWeight.bold,
                ),
              ),
                   SizedBox(height: SizeConfig.screenHeight * 0.01),
                Text(
                "Email ve şifrenizle yada\n google hesabınız ile giriş yapın.",
                textAlign: TextAlign.center,
              ),
                   SizedBox(height: SizeConfig.screenHeight * 0.05),
                   SignForm(),
                   SizedBox(height: SizeConfig.screenHeight * 0.04),
                   GoogleSign(
                icon: "assets/icons/google-icon.svg",
                press: () {},
              ),
                   SizedBox(height: SizeConfig.screenHeight * 0.05),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Bir hesabınız yok mu ?",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(15)),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () => Navigator.popAndPushNamed(
                            context, ForgetPasswordScreen.routeName),
                        child: Text(
                          "Kayıt Ol",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(15),
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    ));
  }
}