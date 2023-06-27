import 'package:flutter/material.dart';

import '../size_config.dart';

class defaultButton extends StatelessWidget {
  const defaultButton(
      {super.key, required this.text, required this.press});
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(200),
      height: getProportionateScreenHeight(56),
      child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
            backgroundColor:
            MaterialStateProperty.all<Color>(Color.fromARGB(200, 10, 9, 8)),
          ),
          onPressed: () {press();},
          child: Text(
            text,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(18), color: Colors.white),
          )),
    );
  }
}