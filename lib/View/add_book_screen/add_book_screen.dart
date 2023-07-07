import 'dart:io';
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

enum BookLanguage {
  turkishBook,
  englishBook,
}

class BookAddPage extends StatefulWidget {
  @override
  _BookAddPageState createState() => _BookAddPageState();
}

class _BookAddPageState extends State<BookAddPage> {
  String bookName = '';
  String authorName = '';
  BookCondition selectedCondition = BookCondition.secondHandBook;
  BookGenre selectedCondition2 = BookGenre.yksBook;
  BookLanguage selectedCondition3 = BookLanguage.turkishBook;
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 36.0),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Fotoğraf Ekle'),
                        //content: Text(''),
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
              SizedBox(height: 16.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    bookName = value;
                  });
                },
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelText: 'Kitap İsmi',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
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
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelText: 'Yazar İsmi',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Tür:'),
                  SizedBox(width: 10),
                  DropdownButton<BookGenre>(
                    value: selectedCondition2,
                    onChanged: (value) {
                      setState(() {
                        selectedCondition2 = value!;
                      });
                    },
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
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dil:'),
                  SizedBox(width: 10),
                  DropdownButton<BookLanguage>(
                    value: selectedCondition3,
                    onChanged: (value) {
                      setState(() {
                        selectedCondition3 = value!;
                      });
                    },
                    items: [
                      DropdownMenuItem(
                        value: BookLanguage.turkishBook,
                        child: Text('Türkçe'),
                      ),
                      DropdownMenuItem(
                        value: BookLanguage.englishBook,
                        child: Text('İngilizce'),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Durum:'),
                  SizedBox(width: 10),
                  DropdownButton<BookCondition>(
                    value: selectedCondition,
                    onChanged: (value) {
                      setState(() {
                        selectedCondition = value!;
                      });
                    },
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
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  print('Kitap İsmi: $bookName');
                  print('Yazar İsmi: $authorName');
                  print('Kitap Türü: $selectedCondition2');
                  print('Kitap Dili: $selectedCondition3');
                  print('Kitap Durumu: $selectedCondition');
                },
                child: Text('Yayınla'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
