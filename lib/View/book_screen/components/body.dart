import 'package:flutter/material.dart';
import '../../../Model/book.dart';
import 'components.dart';

class Body extends StatelessWidget {
  final Book book;

  const Body({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
       BookImages(book: book ),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              BookDescription(
                book: book,
                pressOnSeeMore: () {},
              ),
                  ],
                ),
              ),
            ],
    );}
}
