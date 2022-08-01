import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:mvp_all/pages/resgistro.dart';
import 'package:mvp_all/styles/colors/colors_views.dart';

import 'Initt.dart';

void main() {
  runApp(const loginn());
}

class loginn extends StatelessWidget {
  const loginn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool visible = true;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: ColorSelect.paginator,
        appBar: AppBar(
          backgroundColor: ColorSelect.paginator,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: ColorSelect.paginatorNext,
              tooltip: 'back',
              onPressed: () {
                Navigator.pop(context);
              }), //IconButton
          title: SizedBox(
            width: double.infinity,
            height: 50,
            child: Row(
              children: [
                Row(
                  children: const [
                    SizedBox(
                      width: 160,
                      child: Text(
                        'Iniciar sesión',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    )
                  ],
                ),
                // Row(
                //   children: [
                //     Container(
                //       width: 150,
                //       alignment: Alignment.centerRight,
                //       child: Image.asset(
                //         'assets/images/splash.png',
                //         color: Colors.white,
                //       ),
                //     )
                //   ],
                // )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 150,
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 40),
                    child: Image.asset(
                      'assets/images/user.png',
                      width: 300,
                    ),
                  ),
                ),
                const ContentBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContentBody extends StatefulWidget {
  const ContentBody({Key? key}) : super(key: key);

  @override
  State<ContentBody> createState() => _ContentBodyState();
}

class _ContentBodyState extends State<ContentBody> {
  bool value = false;
  int val = -1;
  bool visible = true;

  late String _email, _password;
  final auth = FirebaseAuth.instance;

  get color => null;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(left: 20, bottom: 5, top: 30),
          child: const Text(
            'Correo electrónico',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Container(
          width: 360,
          height: 70,
          margin: const EdgeInsets.only(bottom: 10),
          //color: Colors.white,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              filled: true,
              fillColor: ColorSelect.init,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(18),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            onChanged: (value) {
              setState(() {
                _email = value.trim();
              });
            },
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(left: 20, bottom: 5),
          child: const Text(
            'Contraseña',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        SizedBox(
          width: 360,
          height: 70,
          child: TextFormField(
            obscureText: visible,
            obscuringCharacter: '*',
            decoration: InputDecoration(
 
              filled: true,
              fillColor: ColorSelect.init,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(18),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(18),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    visible = !visible;
                  });
                },
                icon: Icon(visible ? Icons.visibility_off : Icons.visibility),
              ),
            ),
            onChanged: (value) {
              setState(() {
                _password = value.trim();
              });
            },
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          width: 340,
          height: 50,
          margin: const EdgeInsets.only(bottom: 10, top: 160),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ElevatedButton(
            onPressed: (){
                auth.signInWithEmailAndPassword(email: _email, password: _password).then((_){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => hinit()));
                });
            },
            style: ElevatedButton.styleFrom(
                primary: ColorSelect.btnBackgrounBo2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )),
            child: const Text(
              'Ingresar',
              style: TextStyle(fontSize: 18, color: ColorSelect.btnblack),
            ),
          ),
        ),
        Container(
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: const Text(
                  '¿Todavia no tienes una cuenta? ',
                  style: TextStyle(
                    fontSize: 14,
                    color: ColorSelect.btnBackgrounBo1,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              InkWell(
                child: const Text(
                  'Regístrate',
                  style: TextStyle(
                    fontSize: 14,
                    color: ColorSelect.paginatorNext,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const registroo()));
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}


  

  // Future<void> logInWithEmailAndPassword(
  //     {required String email, required String password}) async {
  //   assert(email != null && password != null);
  //   try {
  //     await _firebaseAuth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //   } on Exception {
  //     throw LogInWithEmailAndPasswordFailure();
  //   }
  // }





//   static Future<User?> iniciarSesion() async {
//     FirebaseAuth authenticator = FirebaseAuth.instance;
//     User? user;

//     GoogleSignIn objGoogleSingIn = GoogleSignIn();
//     GoogleSignInAccount? objGoogleSingInAccount =
//         await objGoogleSingIn.signIn();

//     if (objGoogleSingInAccount != null) {
//       GoogleSignInAuthentication objGoogleSingInAuthentication =
//           await objGoogleSingInAccount.authentication;
//       AuthCredential credential = GoogleAuthProvider.credential(
//           accessToken: objGoogleSingInAuthentication.accessToken,
//           idToken: objGoogleSingInAuthentication.idToken);
//       try {
//         UserCredential userCredential =
//             await authenticator.signInWithCredential(credential);

//         user = userCredential.user;
//         return user;
//       } on FirebaseAuthException catch (e) {
        
//         print("error en la Authentificacion");
//       }
//     }
//   }
// }
