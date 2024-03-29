import 'package:flutter/material.dart';
import 'package:libvary_app/constants.dart';
import 'package:libvary_app/size_config.dart';

import 'main_screen_contents.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(30)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10),
            ),
            child: Row(
              children: [
                SizedBox(width: getProportionateScreenWidth(25),),
                 Container(
                   width: SizeConfig.screenWidth * 0.8 ,
                   height: 40,
                   decoration: BoxDecoration(
                     color: kSecondaryColor.withOpacity(0.1),
                     borderRadius: BorderRadius.circular(15),
                   ),
                   child: TextField(
                     decoration: InputDecoration(
                       enabledBorder: InputBorder.none,
                       focusedBorder: InputBorder.none,
                       hintText: "Kitap Ara",
                       prefixIcon: Icon(Icons.search),
                       contentPadding: EdgeInsets.symmetric(
                         horizontal: getProportionateScreenWidth(20),
                         vertical: getProportionateScreenWidth(10),
                       )
                     ),
                   ),
                 )
              ],
            ),
          ),
          PopularProducts(),
        ]
      ),
    ));
  }
}
