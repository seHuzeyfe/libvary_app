import 'package:flutter/material.dart';
import 'package:libvary_app/View/sign_up_screen/sign_up_screen.dart';
import 'package:libvary_app/constants.dart';
import 'package:libvary_app/size_config.dart';
import '../../../controller/google_sign_in.dart';
import 'sign_in_screen_contents.dart';
import 'package:libvary_app/navigation_bar.dart';

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
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              GoogleSign(),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
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
                            context, SignUpScreen.routeName),
                        child: Text(
                          "Kayıt Ol",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(15),
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              GestureDetector(
                  onTap: () => Navigator.popAndPushNamed(
                      context,MainNavigationBar.routeName),
                  child: Text(
                    "Giriş yapmadan devam et",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(15),
                      color: kPrimaryColor,
                    ),
                  )),
            ],
          ),
        ),
      ),
    ));
  }
}
