import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../components/navigation_bar.dart';
import '../size_config.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

 signOutWithGoogle() async {
  await FirebaseAuth.instance.signOut();
  await GoogleSignIn().signOut();
 }



class GoogleSign extends StatefulWidget {
  const GoogleSign({super.key});

  @override
  State<GoogleSign> createState() => _GoogleSignState();
}

class _GoogleSignState extends State<GoogleSign> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await signInWithGoogle();
        goToMainPage();
      },
      child: Container(
        padding: EdgeInsets.all(getProportionateScreenWidth(5)),
        height: getProportionateScreenHeight(45),
        width: getProportionateScreenWidth(45),
        decoration:
        BoxDecoration(color: Color(0xFFF5F6F9), shape: BoxShape.circle),
        child: SvgPicture.asset("assets/icons/google-icon.svg"),
      ),
    );
  }
  goToMainPage(){
    return Navigator.pushNamed(
        context,MainNavigationBar.routeName);
  }
}

 isSignedIn()
 {
   return (FirebaseAuth.instance.currentUser != null);
 }

 getUserInfo (String request){
   var  user= FirebaseAuth.instance.currentUser;
   if ( user != null) {
       for (final providerProfile in user.providerData) {
       // ID of the provider (google.com, apple.cpm, etc.)
       final provider = providerProfile.providerId;

       // UID specific to the provider
       final uid = providerProfile.uid;

       // Name, email address, and profile photo URL
       final name = providerProfile.displayName;
       final emailAddress = providerProfile.email;
       final profilePhoto = providerProfile.photoURL;

        if(request == "photo" )
          {
            return profilePhoto;
          }
        else if (request == "name")
          {
            return name;
          }
        else
          return emailAddress;
       }
   }
}

