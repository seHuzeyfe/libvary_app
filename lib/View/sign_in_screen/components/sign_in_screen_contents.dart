import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:libvary_app/navigation_bar.dart';
import 'package:libvary_app/size_config.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../controller/authentication.dart';
import '../../forget_password_screen/forget_password_screen.dart';


final List<String> errors = [];
final _formKey = GlobalKey<FormState>();

class SuffixIcon extends StatelessWidget {
  final String svgIcon;
  const SuffixIcon({super.key, required this.svgIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
      ),
      child: SvgPicture.asset(
        svgIcon,
        height: getProportionateScreenHeight(18),
      ),
    );
  }
}

class FormErrors extends StatelessWidget {
  const FormErrors({super.key, required this.errors});

  final List<String> errors;
  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
            errors.length, (index) => formErrorText(errors[index])));
  }

  Row formErrorText(String error) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Error.svg",
          height: getProportionateScreenWidth(14),
          width: getProportionateScreenHeight(14),
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Text(error),
      ],
    );
  }
}

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  State<SignForm> createState() => _SignFormState();
}


class _SignFormState extends State<SignForm> {

  String email = "";
  String password = "";
  bool remember = false;
  String? errorMessage = "";

  Future<void> signInWithEmailAndPassword() async {
    try{
      await Auth().signInWithEmailAndPassword(
          email: email,
          password: password,
      );
    }on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          emailFormBody(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          passwordFormBody(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          FormErrors(errors: errors),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          DefaultButton(
              text: "Giriş Yap",
              press: () async{
                bool isvalid = false;
                isvalid = _formKey.currentState!.validate();
                  if (isvalid) {
                  _formKey.currentState!.save();
                  await signInWithEmailAndPassword();
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return
                          Container(
                          height: getProportionateScreenHeight(250),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10))),
                          child: Stack(children: [
                            Center(
                              child: Image.asset(
                                "assets/images/success.png",
                                height: getProportionateScreenHeight(245),
                              ),
                            ),
                            Center(
                              heightFactor: double.infinity,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(height: 35),
                                  Text(
                                    "Giriş Başarılı",
                                    style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(17),
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                                  ),
                                ],
                              ),
                            )
                          ]),
                        );
                      });
                await Future.delayed(Duration(seconds: 2));
                Navigator.pushNamed(context, MainNavigationBar.routeName);
              }
              }
              ),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value!;
                  });
                },
              ),
              Text("Beni Hatırla"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.popAndPushNamed(
                    context, ForgetPasswordScreen.routeName),
                child: Text("Şifremi Unuttum",
                    style: TextStyle(decoration: TextDecoration.underline)),
              ),
              SizedBox(
                width: getProportionateScreenWidth(10),
              ),
            ],
          )
        ],
      ),
    );
  }

  emailFormBody() {
    return TextFormField(
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }

      },
      validator: (value) {
        if (value!.isEmpty  && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          }
          );
          return  "";
        } else if (value.isEmpty &&
            !emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
            setState(() {
            errors.add(kInvalidEmailError);
          });
            return  "";
        }
        return null;
        },
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        //dekorasyon theme dosyasının içinde düzenlendi
        labelText: "Email",
        hintText: "Email'inizi giriniz",
        suffixIcon: SuffixIcon(
          svgIcon: "assets/icons/Mail.svg",
        ),
      ),
    );
  }

  passwordFormBody() {
    return TextFormField(
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty  && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
          return  "";
        } else if (value.isNotEmpty &&
            value.length < 8 &&
            !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
          }
          );
          return  "";
        }
         return null;
      },
      obscureText: true,
      decoration: InputDecoration(
        //dekorasyon theme dosyasının içinde düzenlendi
        labelText: "Şifre",
        hintText: "Şifrenizi giriniz",
        suffixIcon: SuffixIcon(
          svgIcon: "assets/icons/Lock.svg",
        ),
      ),
    );
  }
}


