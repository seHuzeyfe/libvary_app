import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Model/book.dart';
import '../View/book_screen/book_screen.dart';
import '../constants.dart';
import '../size_config.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.book,
  }) : super(key: key);

  final double width, aspectRetio;
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: BookDetailsArguments(book: book),
          ),
          child: SingleChildScrollView(
            child: Stack(
              children:[ Column(
                children: [
                  AspectRatio(
                    aspectRatio: 1.4,
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                      decoration: BoxDecoration(
                        color: kSecondaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Hero(
                        tag: book.id.toString(),
                        child: Image.network(book.images),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    book.title,
                    style: TextStyle(color: Colors.black),
                    maxLines: 2,
                  ),
                ],
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                        height: getProportionateScreenWidth(28),
                        width: getProportionateScreenWidth(28),
                        decoration: BoxDecoration(
                          color: book.isFavorite
                              ? kPrimaryColor.withOpacity(0.15)
                              : kSecondaryColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/Heart Icon_2.svg",
                         // ignore: deprecated_member_use
                          color:book.isFavorite
                              ? Color(0xFFFF4848)
                              : Color(0xFFDBDEE4),
                        ),
                      ),
                    ),
                  ],
                )
            ]),
          ),
        ),
      ),
    );
  }
}