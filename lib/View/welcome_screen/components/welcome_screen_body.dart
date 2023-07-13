import 'package:flutter/material.dart';
import 'package:libvary_app/View/sign_in_screen/sign_in_screen.dart';
import 'package:libvary_app/constants.dart';
import 'package:libvary_app/size_config.dart';
import '../../contents.dart';
import 'welcome_screen_content.dart';
//Düzenli kod için best practice uygulandı...

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> data = [
    {
      "text": "Libvary'e Hoşgeldiniz...",
      "image": "assets/images/welcome_page_picture4.png",
    },
    {
      "text": "Sürdürülebilirliğe Destek Olun "
          "Ve Doğayı Koruyun",
      "image": "assets/images/welcome_page_picture.jpg",
    },
    {
      "text": "Kitap Bağışıyla ihtiyacı olanlara kitaplarınızı ulaştırın",
      "image": "assets/images/welcome _page_picture3.jpg",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: data.length,
                  itemBuilder: (context, index) => WelcomeScreenContent(
                    text: data[index]["text"]!, // ! non-null operatörü
                    image: data[index]["image"]!,
                  ),
                )),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(55)),
                  child: Column(
                    children: [
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          data.length,
                          (index) => slideDots(index: index),
                        ),
                      ),
                      Spacer(flex: 3),
                      defaultButton(text: "Devam Et", press: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      }),
                      Spacer(),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  AnimatedContainer slideDots({var index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}


