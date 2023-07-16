import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:libvary_app/View/profile_Screen/profile_menu.dart';
import '../../controller/google_sign_in.dart';
import '../sign_in_screen/sign_in_screen.dart';


class ProfileScreen extends StatefulWidget {
  static String routeName = "/ProfileScreen";
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

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


          const SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Padding(
                      padding:EdgeInsets.fromLTRB(0, 0, 100, 0),
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
                        style: TextStyle(color: Colors.black),
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
                          height: 130,
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
                          height: 130,
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
                          height: 130,
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
                          height: 130,
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
                ProfileMenu(
                  text: "My Account",
                  icon: "assets/icons/User Icon.svg",
                  press: () => {},
                ),
            Visibility(
              visible: !isUserSignedIn(),
                  child: ProfileMenu(
                    text: "Log In",
                    icon: "assets/icons/Log out.svg",
                    press: () {
                      Navigator.pushNamed(context, SignInScreen.routeName);
                    },
                  ),
                ),
                Visibility(
                  visible: isUserSignedIn(),
                  child: ProfileMenu(
                    text: "Log Out",
                    icon: "assets/icons/Log out.svg",
                    press: ()async{
                await signOutWithGoogle();
                Navigator.pushNamed(context, SignInScreen.routeName);
                },
                  ),
                ),
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
        padding: EdgeInsets.fromLTRB(0, 35, 0, 10),
        child: Stack(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: CircleAvatar(
                radius: 40,
                backgroundImage: _imageFile==null
                    ?AssetImage('assets/images/profile_screen.png')
                    :FileImage(File(_imageFile!.path)) as ImageProvider,
              ),
            ),
        Positioned(
          right: -2,
          bottom: 6,
          child: SizedBox(
            height: 37,
            width: 37,
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide(color: Colors.white),
                ),
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFFF5F6F9),
              ),
              onPressed: () {},
              child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
            ),
          ),
        )],
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

class SignOutButton extends StatefulWidget {
  final String text = "";
  final String isSigned = "";
  const SignOutButton({super.key});

  @override
  State<SignOutButton> createState() => _SignOutButton();
}

class _SignOutButton extends State<SignOutButton> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isUserSignedIn(),
      child: ElevatedButton(
        onPressed: ()async{
          await signOutWithGoogle();
          Navigator.pushNamed(context, SignInScreen.routeName);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
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

class SignInButton extends StatefulWidget {
  const SignInButton({super.key});

  @override
  State<SignInButton> createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !isUserSignedIn(),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, SignInScreen.routeName);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ) ,
          ),
        ),
        child: Text(
          'Giriş Yap',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
