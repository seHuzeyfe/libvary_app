import 'package:flutter/material.dart';
import 'package:libvary_app/constants.dart';
import '../../../components/default_button.dart';
import '../../../controller/google_sign_in.dart';
import '../../../size_config.dart';
import '../../sign_in_screen/components/sign_in_screen_contents.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
                Text(
                  "Hesap Kaydı",
                  style: headStyle,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Text(
                  "Hesap Bilgilerini gir \n veya google ile devam et",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String email = "";
  String password = "";
  String confirmPassword = "";
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            emailFormBody(),
            SizedBox(
              height: getProportionateScreenHeight(40),
            ),
            passwordFormBody(),
            SizedBox(
              height: getProportionateScreenHeight(40),
            ),
            ConfirmpasswordFormBody(),
            SizedBox(height: getProportionateScreenHeight(30)),
            FormErrors(errors: errors),
            SizedBox(height: getProportionateScreenHeight(30)),
            DefaultButton(
                text: "Devam Et",
                press: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                }),
            SizedBox(height: getProportionateScreenHeight(40)),
            GoogleSign(),
          ],
        ));
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

        return null;
      },
      validator: (value) {
        if (value!.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
        } else if (value.length > 0 &&
            !emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
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
        if (value!.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
        } else if (value.length > 0 &&
            value.length < 8 &&
            !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
          });
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


  ConfirmpasswordFormBody() {
    String kPasswordAgain = "Şifrenizi tekrar giriniz";

    return TextFormField(
      onSaved: (newValue) => confirmPassword = newValue!,
      onChanged: (value) {
        if (password == confirmPassword) {
          setState(() {
            errors.remove(kMatchPassError);
          });}
          else if (value != null)
            {
              setState(() {
                errors.remove(kPasswordAgain);
              });
            }

        return null;
      },
      validator: (value) {
        if (!errors.contains(kPasswordAgain))
          if (value!.isEmpty &&
            !errors.contains(kPassNullError) &&
            !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kPasswordAgain);
          });
        } else if (password != confirmPassword && !errors.contains(kMatchPassError)) {
          setState(() {
            errors.add(kMatchPassError);
          });
        }
        return null;
      },
      obscureText: true,
      decoration: InputDecoration(
        //dekorasyon theme dosyasının içinde düzenlendi
        labelText: "Şifreyi Onayla",
        hintText: "Şifrenizi tekrar giriniz",
        suffixIcon: SuffixIcon(
          svgIcon: "assets/icons/Lock.svg",
        ),
      ),
    );
  }
}
