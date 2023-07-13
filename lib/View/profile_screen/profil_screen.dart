
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:firebase_storage/firebase_storage.dart';

class profilEkrani extends StatefulWidget {
  const profilEkrani({Key? key}) : super(key: key);

  @override
  State<profilEkrani> createState() => _profilEkraniState();
}

class _profilEkraniState extends State<profilEkrani> {

  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();
  final user= FirebaseAuth.instance.currentUser??"";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              imageProfile(),
              const Text(
                'İsim Soyisim',
                style: TextStyle(
                  fontSize: 22,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 100,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'Kategoriler',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: ElevatedButton(
                              onPressed: () {

                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<
                                    Color>(Colors.white),
                                foregroundColor: MaterialStateProperty.all<
                                    Color>(Colors.black),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: const BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                              child: const Text('Edebiyat'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<
                                    Color>(Colors.white),
                                foregroundColor: MaterialStateProperty.all<
                                    Color>(Colors.black),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                              child: const Text('Polisiye'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<
                                    Color>(Colors.white),
                                foregroundColor: MaterialStateProperty.all<
                                    Color>(Colors.black),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: const BorderSide(color: Colors.black),
                                  ),
                                ),
                              ),
                              child: const Text('Roman'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 200,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
                          child: Text(
                            'Kitaplarım',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          child: const Text(
                            'Tümünü Gör',
                            style: TextStyle(color: Colors.grey),
                          ),

                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Card(
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.black,
                                image: DecorationImage(
                                  image: AssetImage('assets/images/kitap1.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.black,
                                image: DecorationImage(
                                  image: AssetImage('assets/images/kitap2.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.black,
                                image: DecorationImage(
                                  image: AssetImage('assets/images/kitap3.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.black,
                                image: DecorationImage(
                                  image: AssetImage('assets/images/kitap4.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
             /* Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 200,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
                          child: Text(
                            'Koleksiyonlar',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          child: const Text(
                            'Tümünü Gör',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Card(
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/kitap5.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/kitap6.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/kitap7.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/kitap8.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),*/

             Center(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   ElevatedButton(
                       onPressed: () async{
                         await FirebaseAuth.instance.signOut();
                       },
                     style: ButtonStyle(
                       backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                       foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                         RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10),
                         ),
                       ),
                     ),
                     child: Text(
                       'Çıkış Yap',
                       style: TextStyle(
                         color: Colors.black,
                       ),
                     ),
                   ),
                 ],
               ),
             ),
            ],
          ),
        ],
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 60, 0, 10),
        child: Stack(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: _imageFile == null
                  ? AssetImage('assets/images/profile_screen.png')
                  : FileImage(File(_imageFile!.path)) as ImageProvider,
            ),
            Positioned(
              bottom: -10,
              right: -5,
              child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: ((build) => bottomSheet()),
                  );
                },
                icon: Icon(Icons.add_a_photo,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery
          .of(context)
          .size
          .width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text('Profil Fotoğrafı Seçiniz',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.grey),
                ),
                icon: Icon(Icons.camera),
                label: Text('Kamera'),
              ),
              SizedBox(width: 10),
              ElevatedButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.grey),
                ),
                icon: Icon(Icons.image),
                label: Text('Galeri'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    XFile? pickedFile = await _picker.pickImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile as PickedFile?;
    });
  }
}

