import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:libvary_app/Model/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore _firestore = FirebaseFirestore.instance;

CollectionReference bookRef = _firestore.collection('book');

Stream collectionStream = FirebaseFirestore.instance.collection('book').snapshots();



Future<void> addBook(int id,String images,String title,String description,bool isFavorite) {
  Book book = Book(id: id, images: images, title: title, description: description,isFavorite: isFavorite);
    return bookRef.add({
    'id': book.id,
    'title': book.title,
    'isFavorite': book.isFavorite,
    'description' : book.description,
      'image':book.images
  })
      .then((value) => AlertDialog(content: Text("$value")))
      .catchError((error) => AlertDialog(content: Text("$error")));


}

Future<void> fetchBook() async {
  try {
    final collectionSnapshot = await FirebaseFirestore.instance
        .collection('book')
        .get();

    books = await Future.wait(collectionSnapshot.docs.map((doc) async {
      final data = doc.data();


      final imageURL = await FirebaseStorage.instance
          .ref('books/${data['image']}')
          .getDownloadURL();

      return Book(
        id: data['id'],
        title: data['title'],
        description: data['description'],
        images: imageURL,
        isFavorite: data['isFavorite'],
      );
    }).toList());
  } catch (e) {
    if (kDebugMode) {
      print('Error fetching books: $e');
    }
  }
}


