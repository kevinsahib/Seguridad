// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvp_all/styles/colors/colors_views.dart';

// Importaciones clase Vistas
import '../pages/Home.dart';
import '../pages/on_boarding.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _toOnbording();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSelect.init,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 110),
              child: const Text(
                'DOOR WATER ',
                style: TextStyle(
                  fontSize: 28,
                  color: ColorSelect.texButton1,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Center(
              child: Container(
                height: 220,
                margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
                child: Image.asset(
                  'assets/images/gota.png',
                  width: 300,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 300),
              child: const Text(
                '¡HIDRATATE CON AGUA DE CALIDAD! ',
                style: TextStyle(
                  fontSize: 20,
                  color: ColorSelect.btnblack,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _toOnbording() async {
    await Future.delayed(const Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => homeinit(),
      ),
    );
  }
}
