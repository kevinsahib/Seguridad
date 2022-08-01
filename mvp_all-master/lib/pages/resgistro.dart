import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mvp_all/pages/Home.dart';
import 'package:mvp_all/pages/login.dart';
import 'package:mvp_all/styles/colors/colors_views.dart';

void main() {
  runApp(const registroo());
}

class registroo extends StatelessWidget {
  const registroo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool value = false;
    bool visible = true;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorSelect.paginator,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            tooltip: 'back',
            color: ColorSelect.paginatorNext,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: SizedBox(
            width: double.infinity,
            height: 50,
            child: Row(
              children: [
                Row(
                  children: const [
                    SizedBox(
                      width: 220,
                      child: Text(
                        'Regístrate',
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
                //       width: 90,
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
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 40,
                margin: const EdgeInsets.only(top: 30),
                child: const Text(
                  'Crea una cuenta para empezar usar la app',
                  style: TextStyle(
                      fontSize: 16,
                      color: ColorSelect.btnTextBo1,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const ContentBody(),
            ],
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
  late String _email, _password, _name;
  final auth = FirebaseAuth.instance;
  bool value = false;
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 310,
        width: 350,
        margin: const EdgeInsets.only(top: 40),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 2, bottom: 5),
              child: const Text(
                'Nombre',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 350,
              height: 70,
              margin: const EdgeInsets.only(bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nombre completo',
                  labelStyle: const TextStyle(
                    color: ColorSelect.btnTextBo1,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: ColorSelect.btnTextBo1,
                      width: 1.5,
                    ),
                  ),
                ),
                style: const TextStyle(
                  fontSize: 16,
                  color: ColorSelect.btnTextBo1,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 2, bottom: 5),
              child: const Text(
                'Correo electronico',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 350,
              height: 70,
              margin: const EdgeInsets.only(bottom: 10),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Dirección correo',
                  labelStyle: const TextStyle(
                    color: ColorSelect.btnTextBo1,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: ColorSelect.btnTextBo1,
                      width: 1.5,
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _email = value.trim();
                  });
                },
                style: const TextStyle(
                  fontSize: 16,
                  color: ColorSelect.btnTextBo1,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 2, bottom: 5),
              child: const Text(
                'Contraseña',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 350,
              height: 70,
              child: TextField(
                obscureText: visible,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  labelStyle: const TextStyle(
                    color: ColorSelect.btnTextBo1,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: ColorSelect.btnTextBo1,
                      width: 1.5,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        visible = !visible;
                      });
                    },
                    icon:
                        Icon(visible ? Icons.visibility_off : Icons.visibility),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _password = value.trim();
                  });
                },
                style: const TextStyle(
                  fontSize: 16,
                  color: ColorSelect.btnTextBo1,
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        width: 340,
        height: 50,
        margin: const EdgeInsets.only(left: 17),
        child: const Text(
          'La contraseña debe contener caracteres, números y símbolos con un mínimo de 6 caracteres.',
          style: TextStyle(
            color: ColorSelect.btnTextBo1,
          ),
        ),
      ),
      // Container(
      //   width: 350,
      //   height: 50,
      //   margin: const EdgeInsets.only(left: 26, right: 75),
      //   child: Row(
      //     children: [
      //       Row(
      //         children: [
      //           Container(
      //             width: 15,
      //             height: 30,
      //             margin: const EdgeInsets.only(right: 18, bottom: 14),
      //             child: Checkbox(
      //                 value: value,
      //                 side: const BorderSide(
      //                   color: ColorSelect.btnTextBo1,
      //                   width: 1.5,
      //                 ),
      //                 shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(10),
      //                 ),
      //                 onChanged: (bool? valueNew) {}),
      //           )
      //         ],
      //       ),
      //       Row(
      //         children: [
      //           SizedBox(
      //             height: 50,
      //             child: Row(
      //               children: [
      //                 Column(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Row(
      //                       children: [
      //                         const Text(
      //                           'Al registrarme, acepto los',
      //                           style: TextStyle(fontSize: 15),
      //                         ),
      //                         InkWell(
      //                           onTap: () {
      //                             Route route = MaterialPageRoute(
      //                                 builder: (context) => const homeinit());
      //                             Navigator.push(context, route);
      //                           },
      //                           child: const Text(
      //                             ' términos y',
      //                             style: TextStyle(
      //                               fontSize: 15,
      //                               color: ColorSelect.paginatorNext,
      //                               fontWeight: FontWeight.bold,
      //                             ),
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                     Row(
      //                       children: const [
      //                         InkWell(
      //                           child: Text(
      //                             'condiciones',
      //                             style: TextStyle(
      //                               fontSize: 15,
      //                               color: ColorSelect.paginatorNext,
      //                               fontWeight: FontWeight.bold,
      //                             ),
      //                           ),
      //                         ),
      //                         InkWell(
      //                           child: Text(
      //                             ' y la',
      //                             style: TextStyle(fontSize: 15),
      //                           ),
      //                         ),
      //                         InkWell(
      //                           child: Text(
      //                             ' política de privacidad',
      //                             style: TextStyle(
      //                               fontSize: 15,
      //                               color: ColorSelect.paginatorNext,
      //                               fontWeight: FontWeight.bold,
      //                             ),
      //                           ),
      //                         )
      //                       ],
      //                     )
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           )
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
      Container(
        width: 340,
        height: 50,
        margin: const EdgeInsets.only(bottom: 10, top: 110),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ElevatedButton(
          onPressed: () {
            auth
                .createUserWithEmailAndPassword(
                    email: _email, password: _password)
                .then((_) {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const loginn()));
            });
          },
          style: ElevatedButton.styleFrom(
              primary: ColorSelect.btnBackgrounBo2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              )),
          child: const Text(
            'Crear Cuenta',
            style: TextStyle(fontSize: 18, color: ColorSelect.btnblack),
          ),
        ),
      ),
      Container(
        width: 300,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            child: const Text(
              '¿Ya tienes una cuenta? ',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ColorSelect.btnblack),
              textAlign: TextAlign.left,
            ),
          ),
          InkWell(
            child: const Text(
              'Iniciar sesion',
              style: TextStyle(
                fontSize: 14,
                color: ColorSelect.paginatorNext,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const loginn()));
            },
          ),
        ]),
      ),
    ]);
  }
}
