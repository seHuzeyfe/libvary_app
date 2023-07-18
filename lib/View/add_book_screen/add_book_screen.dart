import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

enum BookCondition {
  newBook,
  secondHandBook,
}

enum BookGenre {
  yksBook,
  lgsBook,
  tusBook,
  dgsBook,
  alesBook,
  kpssBook,
  romanBook,
  felsefeBook,
}

class BookAddPage extends StatefulWidget {
  static String routeName = "/BookAddPage";

  const BookAddPage({super.key});

  @override
  _BookAddPageState createState() => _BookAddPageState();
}

class _BookAddPageState extends State<BookAddPage> {
  String? imageUrl;

  Future<void> uploadImageToFirebase(File imageFile) async {
    if (imageFile != null) {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference reference = FirebaseStorage.instance
          .ref()
          .child('kitapilanresimleri')
          .child(fileName);

      UploadTask uploadTask = reference.putFile(imageFile);
      TaskSnapshot snapshot = await uploadTask;

      if (snapshot.state == TaskState.success) {
        String downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          imageUrl = downloadUrl;
        });
        print('Fotoğraf başarıyla yüklendi: $downloadUrl');
      } else {
        print('Fotoğraf yükleme hatası: ${snapshot.state}');
      }
    }
  }

  void yukle() async {
    await uploadImageToFirebase(_imageFile!);

    FirebaseFirestore.instance.collection('kitaplar').add({
      'kitap_ismi': bookName,
      'yazar_ismi': authorName,
      'kitap_turu': selectedCondition2.toString(),
      'kitap_durumu': selectedCondition.toString(),
      'resim_url': imageUrl,
    }).then((value) {
      print('Kitap başarıyla Firestore\'a eklendi!');
    }).catchError((error) {
      print('Kitap ekleme hatası: $error');
    });
  }

  String bookName = '';
  String authorName = '';
  BookCondition selectedCondition = BookCondition.secondHandBook;
  BookGenre selectedCondition2 = BookGenre.yksBook;
  File? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("İlan Ekle"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Fotoğraf Ekle'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _pickImage(ImageSource.gallery);
                            },
                            child: Text('Galeri'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _pickImage(ImageSource.camera);
                            },
                            child: Text('Kamera'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[200],
                    image: _imageFile != null
                        ? DecorationImage(
                            image: FileImage(_imageFile!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: _imageFile == null
                      ? Icon(
                          Icons.camera_alt,
                          size: 80,
                          color: Colors.grey[400],
                        )
                      : null,
                ),
              ),
              SizedBox(height: 32.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    bookName = value;
                  });
                },
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Kitap İsmi',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  hintText: 'Kitap ismini giriniz',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    authorName = value;
                  });
                },
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Yazar İsmi',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  hintText: 'Yazar ismini giriniz',
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: DropdownButtonFormField<BookGenre>(
                      hint: const Text('Kitap türünü seçiniz'),
                      value: selectedCondition2 != BookGenre.yksBook
                          ? selectedCondition2
                          : null,
                      onChanged: (value) {
                        setState(() {
                          selectedCondition2 = value!;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.menu_book_rounded,
                          color: Colors.black54,
                        ),
                        labelText: 'Kitap Türü',
                        labelStyle: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      items: [
                        DropdownMenuItem(
                          value: BookGenre.yksBook,
                          child: Text('YKS'),
                        ),
                        DropdownMenuItem(
                          value: BookGenre.tusBook,
                          child: Text('TUS'),
                        ),
                        DropdownMenuItem(
                          value: BookGenre.kpssBook,
                          child: Text('KPSS'),
                        ),
                        DropdownMenuItem(
                          value: BookGenre.alesBook,
                          child: Text('ALES'),
                        ),
                        DropdownMenuItem(
                          value: BookGenre.dgsBook,
                          child: Text('DGS'),
                        ),
                        DropdownMenuItem(
                          value: BookGenre.lgsBook,
                          child: Text('LGS'),
                        ),
                        DropdownMenuItem(
                          value: BookGenre.romanBook,
                          child: Text('Roman'),
                        ),
                        DropdownMenuItem(
                          value: BookGenre.felsefeBook,
                          child: Text('Felsefe'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: DropdownButtonFormField<BookCondition>(
                      hint: const Text('Kitap durumunu seçiniz'),
                      value: selectedCondition != BookCondition.secondHandBook
                          ? selectedCondition
                          : null,
                      onChanged: (value) {
                        setState(() {
                          selectedCondition = value!;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.menu_book_rounded,
                          color: Colors.black54,
                        ),
                        labelText: 'Kitap Durumu',
                        labelStyle: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      items: [
                        DropdownMenuItem(
                          value: BookCondition.newBook,
                          child: Text('Yeni'),
                        ),
                        DropdownMenuItem(
                          value: BookCondition.secondHandBook,
                          child: Text('İkinci El'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: Size(220, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: () {
                  yukle();
                  print('Kitap İsmi: $bookName');
                  print('Yazar İsmi: $authorName');
                  print('Kitap Türü: $selectedCondition2');
                  print('Kitap Durumu: $selectedCondition');
                },
                child: Text(
                  'Yayınla',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
