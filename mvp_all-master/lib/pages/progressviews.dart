import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mvp_all/pages/resgistro.dart';
import 'package:mvp_all/pages/Home.dart';
import 'package:mvp_all/pages/login.dart';
import 'package:mvp_all/pages/recuperarPass.dart';
import 'package:mvp_all/painter/progresspainters.dart';

class ProgressView extends StatefulWidget {
  const ProgressView(
      //Key? key,
      this.name);
  final name;
  @override
  State<ProgressView> createState() => _ProgressViewState(name);
}

class _ProgressViewState extends State<ProgressView> {
  _ProgressViewState(this.name);
  final name;
  int porcentaje = 0;
  late Timer timer;
  @override
  void initState() {
    porcentajeLoad();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 100,
        height: 100,
        child: CustomPaint(
          painter: ProgressPainter(porcentaje),
        ),
      ),
    );
  }

  void porcentajeLoad() {
    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        if (porcentaje < 100) {
          porcentaje += 2;
        } else {
          timer.cancel();
          Navigator.pop(context);
          if (name == "OnBoarding") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const homeinit(),
              ),
            );
          }
        }
      });
    });
  }
}
