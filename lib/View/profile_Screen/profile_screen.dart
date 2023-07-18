
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:libvary_app/View/profile_Screen/profile_menu.dart';
import 'package:libvary_app/navigation_bar.dart';
import 'package:libvary_app/size_config.dart';
import '../../Model/book.dart';
import '../../components/book_card.dart';
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
            child:Text(isUserSignedIn() ? getUserInfo("name") : "",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                ProfileMenu(
                  text: "My Account",
                  icon: "assets/icons/User Icon.svg",
                  press: () => {},
                ),
                SizedBox(height: getProportionateScreenHeight(10),),
                Text(
                  'Kitaplarım',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(15),),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...List.generate(
                        books.length,
                            (index) {
                          return BookCard(book: books[index]);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: getProportionateScreenHeight(20),),
            Visibility(
              visible: !isUserSignedIn(),
                  child: ProfileMenu(
                    text: "   Giriş Yap",
                    icon: "assets/icons/Log out.svg",
                    press: () {
                      Navigator.pushNamed(context, SignInScreen.routeName);
                    },
                  ),
                ),
                Visibility(
                  visible: isUserSignedIn(),
                  child: ProfileMenu(
                    text: "Çıkış Yap",
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
                backgroundColor: Colors.grey,
                radius: 40,
                child: profilePicture(),
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
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((build)=> bottomSheet()),
                );
              },
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
