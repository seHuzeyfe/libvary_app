import 'package:flutter/material.dart';
import '../../Model/book.dart';
import '../../components/book_card.dart';
import '../../size_config.dart';
import 'package:libvary_app/controller/book_controller.dart';

class WishListScreen extends StatelessWidget {

  static String routeName = "/WishLisScreen";
  const WishListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dilek Listesi"),
        centerTitle: true,
      ),
      body: GridView.count(
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          mainAxisSpacing: getProportionateScreenHeight(30),
          padding:
              EdgeInsetsDirectional.symmetric(vertical: 80, horizontal: 10),
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: [
            ...List.generate(
              books.length,
              (index) {
                return BookCard(book: books[index]);
              },
            ),
          ]),
    );
  }
}
