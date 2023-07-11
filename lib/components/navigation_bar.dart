import 'package:flutter/material.dart';
import 'package:libvary_app/View/add_book_screen/add_book_screen.dart';
import 'package:libvary_app/View/main_screen/main_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:libvary_app/size_config.dart';
import '../View/chat_screen/main_chat_screen.dart';

class MainNavigationBar extends StatefulWidget {
  static String routeName = "/MainNavigationBar";
  const MainNavigationBar({super.key});

  @override
  State<MainNavigationBar> createState() => _MainNavigationBarState();
}

class _MainNavigationBarState extends State<MainNavigationBar> {
  int pageIndex = 0;
  List<Widget> pageList = <Widget>[
    //Ekranların listesi
    MainScreen(),
    ChatListScreen(),
    MainScreen(),
    MainScreen(),
    MainScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[pageIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 5),
        child: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
          BottomNavigationBar(
            elevation: 200,
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.white70,
            selectedItemColor: Colors.black,
            selectedIconTheme: IconThemeData(color: Colors.black),
            currentIndex: pageIndex,
            onTap: (value) {
              setState(() {
                pageIndex = value;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: SuffixIconNavBar(
                    svgIcon: "assets/icons/navbar_home.svg",
                    height: getProportionateScreenHeight(28),
                  ),
                  label: "Ana Sayfa"),
              BottomNavigationBarItem(
                  icon: SuffixIconNavBar(
                      svgIcon: "assets/icons/navbar_chats.svg",
                      height: getProportionateScreenHeight(28)),
                  label: "Mesajlar"),
              BottomNavigationBarItem(
                  icon: SuffixIconNavBar(
                    svgIcon: "",
                    height: getProportionateScreenHeight(1),
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: SuffixIconNavBar(
                      svgIcon: "assets/icons/navbar_wishlist.svg",
                      height: getProportionateScreenHeight(28)),
                  label: "Favoriler"),
              BottomNavigationBarItem(
                  icon: CircleAvatar(
                      radius: 15,
                      backgroundImage:
                          AssetImage("assets/images/Profile Image.png")),
                  label: "Profil"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 13, left: 160, right: 160),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all(Size.fromHeight(0)),
                        elevation: MaterialStateProperty.all(5),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(
                            CircleBorder(eccentricity: 0))),
                    onPressed: () {
                      Navigator.popAndPushNamed(context, BookAddPage.routeName);
                    },
                    child: SuffixIconNavBar(
                      svgIcon: "assets/icons/navbar_new.svg",
                      height: getProportionateScreenHeight(55),
                    )),
                SizedBox(height: getProportionateScreenHeight(6)),
                Text("Bağışla",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenWidth(15))),
                SizedBox(height: getProportionateScreenHeight(1)),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class SuffixIconNavBar extends StatelessWidget {
  final String svgIcon;
  final double height;
  const SuffixIconNavBar(
      {super.key, required this.svgIcon, required this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        getProportionateScreenWidth(1),
        getProportionateScreenWidth(1),
        getProportionateScreenWidth(1),
      ),
      child: SvgPicture.asset(
        svgIcon,
        height: height,
      ),
    );
  }
}
