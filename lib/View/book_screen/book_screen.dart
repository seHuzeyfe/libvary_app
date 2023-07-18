import 'package:flutter/material.dart';
import '../../Model/book.dart';
import 'components/body.dart';
import 'components/components.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BookDetailsArguments agrs =
    ModalRoute.of(context)!.settings.arguments as BookDetailsArguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: AppBar(

      ),
      body: Body(book: agrs.book),
    );
  }
}

class BookDetailsArguments {
  final Book book;

  BookDetailsArguments({required this.book});
}