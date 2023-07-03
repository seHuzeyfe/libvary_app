import 'package:flutter/material.dart';
import 'package:libvary_app/size_config.dart';

const kPrimaryColor = Colors.black;
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Colors.black;
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Lütfen emailinizi giriniz";
const String kInvalidEmailError = "Lütfen geçerli bir email girin";
const String kPassNullError = "Lütfen şifrenizi girin";
const String kShortPassError = "Şifre çok kısa";
const String kMatchPassError = "Girdiğiniz şifreler uyuşmuyor";
const String kNamelNullError = "Lütfen adınızı giriniz";
const String kPhoneNumberNullError = "Lütfen telefon numaranızı giriniz";
const String kAddressNullError = "Lütfen adresinizi giriniz";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

final headStyle = TextStyle(
  fontSize: getProportionateScreenWidth(25),
  fontWeight: FontWeight.w600,
  color: Colors.black,
  height: 1.5,
);