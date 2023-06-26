import 'package:flutter/material.dart';
import 'package:libvary_app/constants.dart';
import 'package:libvary_app/size_config.dart';

class WelcomeScreenContent extends StatelessWidget {
  final String text, image;
  const WelcomeScreenContent(
      {super.key, required this.text, required this.image});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(flex: 2),
        Text(
          "LIBVARY",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: Color.fromRGBO(212, 163, 115, 1),
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(flex: 1),
        Text(text,
            textAlign: TextAlign.center,
            selectionColor: Color.fromARGB(255, 198, 172, 143)),
        Spacer(flex: 2),
        Container(
          width: 250,
          //decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          child: Image.asset(
            image,
            height: getProportionateScreenHeight(300),
            width: getProportionateScreenWidth(300),
          ),
        )
      ],
    );
  }
}
