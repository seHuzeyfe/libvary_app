import 'package:flutter/material.dart';
import 'package:libvary_app/size_config.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../sign_in_screen/components/sign_in_screen_contents.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              Text(
                "Şifremi Unuttum",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(20),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              Text(
                  "Lütfen e-postanızı giriniz \n e-postanıza kurtarma linki gönderilecek",
                  textAlign: TextAlign.center),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              ForgetPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({super.key});

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String email = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
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
              hintText: "Emailinizi giriniz",
              suffixIcon: SuffixIcon(
                svgIcon: "assets/icons/Mail.svg",
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          FormErrors(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
              text: "Gönder",
              press: () {
                if (_formKey.currentState!.validate()) {}
              }),
          SizedBox(height: SizeConfig.screenHeight * 0.1)
        ],
      ),
    );
  }
}
