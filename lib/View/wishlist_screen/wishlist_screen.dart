import 'package:flutter/material.dart';

class WishList extends StatelessWidget {
  const WishList({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dilek Listesi"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            10,
                (index) => ProductBox(
              title: "Kitap ${index + 1}",
              subTitle: "Yazar ${index + 1}",
              imageName: "shoes2.png",
            ),
          ),
        ),
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  final String title;
  final String subTitle;
  final String? imageName;

  const ProductBox({
    required this.title,
    required this.subTitle,
    this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      margin: EdgeInsets.all(8.0),
      color: Colors.grey[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imageName != null)
            Image.asset(
              'assets/images/$imageName',
              width: 48,
              height: 48,
              color: Colors.grey[500],
            )
          else
            Icon(
              Icons.image,
              size: 48,
              color: Colors.grey[500],
            ),
          SizedBox(height: 16.0),
          Text(
            title,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, fontFamily: "assets/fonts/muli/Muli.ttf"),
          ),
          SizedBox(height: 8.0),
          Text(
            subTitle,
            style: TextStyle(fontSize: 14.0, fontFamily: "assets/fonts/muli/Muli-.ttf"),
          ),
        ],
      ),
    );
  }
}

