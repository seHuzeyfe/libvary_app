import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../utilities/google_sign_in.dart';

class profilEkrani extends StatefulWidget {
  static String routeName = "/ProfileScreen";
  const profilEkrani({Key? key}) : super(key: key);

  @override
  State<profilEkrani> createState() => _profilEkraniState();
}

class _profilEkraniState extends State<profilEkrani> {

  PickedFile? _imageFile;
  final ImagePicker _picker=ImagePicker();
  final user=FirebaseAuth.instance.currentUser??"";
  final User? currentUser=FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          imageProfile(),
          Center(
            child:Text('İsim Soyisim',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 20),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding:EdgeInsets.all(20.0),
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
                          onPressed: (){},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: const BorderSide(color: Colors.black),
                              ) ,
                            ),
                          ),
                          child: const Text('Edebiyat'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                          onPressed: (){},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                          onPressed: (){},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: const BorderSide(color: Colors.black),
                              ) ,
                            ),
                          ),
                          child: const Text('Roman'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                          onPressed: (){},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: const BorderSide(color: Colors.black),
                              ) ,
                            ),
                          ),
                          child: const Text('YKS'),
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
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Padding(
                      padding:EdgeInsets.fromLTRB(0, 0, 50, 0),
                      child: Text(
                        'Kitaplarım',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed:(){},
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
                            image:DecorationImage(
                              image: AssetImage('assets/images/kitap4.png'),
                              fit:BoxFit.cover,
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfileButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget imageProfile(){
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 60, 0, 10),
        child: Stack(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: _imageFile==null
                  ?AssetImage('assets/images/profile_screen.png')
                  :FileImage(File(_imageFile!.path)) as ImageProvider,
            ),
            Positioned(
              bottom: -10,
              right: -5,
              child: IconButton(
                onPressed: (){
                  showModalBottomSheet(
                    context: context,
                    builder: ((build)=> bottomSheet()),
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
  Widget bottomSheet(){
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            'Profil Fotoğrafı Seçiniz',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: (){
                  takePhoto(ImageSource.camera);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                ),
                icon: Icon(Icons.camera),
                label: Text('Kamera'),
              ),
              SizedBox(width: 10),
              ElevatedButton.icon(
                onPressed: (){
                  takePhoto(ImageSource.gallery);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
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
  void takePhoto(ImageSource source) async{
    XFile? pickedFile = await _picker.pickImage(
      source: source,
    );
    setState(() {
      _imageFile= pickedFile as PickedFile?;
    });
  }
  void saveName(String uid, String name, String surname){
    final userRef =FirebaseFirestore.instance.collection('users').doc(uid);

    userRef.set({
      'name' : name,
      'surname': surname,
    });
  }
}

class ProfileButton extends StatefulWidget {
  final String text = "";
  final String isSigned = "";
  const ProfileButton({super.key});

  @override
  State<ProfileButton> createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isUserSignedIn(),
      child: ElevatedButton(
        onPressed: ()async{
          await signOutWithGoogle();
          //Navigator.pushNamed(context, SignInScreen.routeName);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ) ,
          ),
        ),
        child: Text(
          'Çıkış Yap',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}