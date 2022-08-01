import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mvp_all/pages/login.dart';
import 'package:mvp_all/styles/colors/colors_views.dart';

import 'Initt.dart';

void main() {
  runApp(const homeinit());
}

class homeinit extends StatelessWidget {
  const homeinit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: ColorSelect.paginator,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 100),
                child: const Text(
                  'DOOR WATER ',
                  style: TextStyle(
                    fontSize: 28,
                    color: ColorSelect.texButton1,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: Container(
                  height: 200,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Image.asset(
                    'assets/images/garrafon.png',
                    width: 300,
                  ),
                ),
              ),
              Container(
                width: 340,
                height: 48,
                margin: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 30,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const loginn()));
                  },
                  child: Row(children: const [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 19)),
                    Icon(Icons.supervised_user_circle),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                    Text("Ingresar como Cliente",
                        style: TextStyle(fontSize: 19),
                        textAlign: TextAlign.center),
                  ]),
                  style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    alignment: Alignment.centerLeft,
                    primary: ColorSelect.btnblack,
                    fixedSize: const Size(50, 50),
                    backgroundColor: ColorSelect.init,
                  ),
                ),
              ),
              Container(
                width: 340,
                height: 48,
                margin: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 30,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const loginn()));
                  },
                  child: Row(children: const [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 19)),
                    Icon(Icons.business),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                    Text("Ingresar como Dueño",
                        style: TextStyle(fontSize: 19),
                        textAlign: TextAlign.center),
                  ]),
                  style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    alignment: Alignment.centerLeft,
                    primary: ColorSelect.btnblack,
                    fixedSize: const Size(50, 50),
                    backgroundColor: ColorSelect.buttoof,
                  ),
                ),
              ),
              Container(
                width: 340,
                height: 48,
                margin: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 30,
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    User? user =
                        await Authenticator.iniciarSesion(context: context);
                    if (user != null) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => hinit()));
                    }
                  },
                  child: Row(children: const [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 19)),
                    Icon(Ionicons.logo_google),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                    Text("Ingresar con Google",
                        style: TextStyle(fontSize: 19),
                        textAlign: TextAlign.center),
                  ]),
                  style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    alignment: Alignment.centerLeft,
                    primary: ColorSelect.btnblack,
                    fixedSize: const Size(50, 50),
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 110),
                child: const Text(
                  '¡HASTA LA PUERTA DE TU HOGAR!',
                  style: TextStyle(
                    fontSize: 20,
                    color: ColorSelect.btnBackgrounBo2,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Authenticator {
  static Future<User?> iniciarSesion({required BuildContext context}) async {
    FirebaseAuth authenticator = FirebaseAuth.instance;
    User? user;

    GoogleSignIn objGoogleSingIn = GoogleSignIn();
    GoogleSignInAccount? objGoogleSingInAccount =
        await objGoogleSingIn.signIn();

    if (objGoogleSingInAccount != null) {
      GoogleSignInAuthentication objGoogleSingInAuthentication =
          await objGoogleSingInAccount.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: objGoogleSingInAuthentication.accessToken,
          idToken: objGoogleSingInAuthentication.idToken);
      try {
        UserCredential userCredential =
            await authenticator.signInWithCredential(credential);

        user = userCredential.user;
        return user;
      } on FirebaseAuthException catch (e) {
        print("error en la Authentificacion");
      }
    }
  }

  // //Login con email y password
  // Future<void> logInWithEmailAndPassword({
  //   required String email,
  //   required String password
  // }) async {
  //   assert(email != null && password != null);
  //   try {
  //     await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  //   } on Exception {
  //     throw LogInWithEmailAndPasswordFailure();
  //   }
  // }

  // // cerrar sesion
  // Future<void> logOut() async {
  //   try {
  //     await Future.wait([
  //       _firebaseAuth.signOut(),
  //       _googleSignIn.signOut()
  //     ]);
  //   } on Exception {
  //     throw LogOutFailure();
  //   }
  // }
}

// extension on firebase_auth.User {
//   User get toUser {
//     return User(id: uid, email: email, name: displayName, photo: photoURL);
//   }
// }

