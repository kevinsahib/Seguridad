import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvp_all/styles/colors/colors_views.dart';

void main() {
  runApp(const recuperPass());
}

class recuperPass extends StatelessWidget {
  const recuperPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorSelect.txtBoHe,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            tooltip: 'back',
            color: ColorSelect.paginatorNext,
            onPressed: () {
              Navigator.pop(context);
            },
          ), //IconButton
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
                        'Recuperar contraseña',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 90,
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        'assets/images/splash.png',
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 50,
                  margin: const EdgeInsets.only(top: 30),
                  child: const Text(
                    'Ingresa tu email para restablecer tu contraseña',
                    style: TextStyle(
                        fontSize: 16,
                        color: ColorSelect.btnTextBo1,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
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
                          'Correo electrónico',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: 360,
                        height: 70,
                        margin: const EdgeInsets.only(bottom: 15),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Dirección de correo',
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
                        width: 400,
                        height: 100,
                        margin: const EdgeInsets.only(
                            left: 13, right: 10, bottom: 10),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 1.5),
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                'Ingrese su correo electrónico registrado y le',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: ColorSelect.btnTextBo1,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(bottom: 1.5),
                              child: const Text(
                                'enviaremos un correo electrónico que contiene un',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: ColorSelect.btnTextBo1,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(bottom: 1.5),
                              child: const Text(
                                'enlace para restablecer su contraseña',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: ColorSelect.btnTextBo1,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 340,
                  height: 50,
                  margin: const EdgeInsets.only(bottom: 10, top: 240),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: ColorSelect.btnBackgrounBo2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                    child: const Text(
                      'Enviar Solicitud',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
