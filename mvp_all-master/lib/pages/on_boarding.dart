import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mvp_all/pages/Home.dart';
import 'package:mvp_all/pages/progressviews.dart';
import 'package:mvp_all/styles/colors/colors_views.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int page = 0;
  PageController pageController = PageController();
  List<Map<String, String>> onBoardingDatas = [
    {
      "text": "ESPARCIMIENTO",
      "text1": "Brindamos todos los servicios para consentir",
      "image": 'assets/images/B1.png',
    },
    {
      "text": "ADOPCIÓN",
      "text1": "agregar texto largote para la parte de adopcion",
      "image": 'assets/images/B2.png',
    },
    {
      "text": "HOSPITALIDAD",
      "text1": "agregar texto largo para la parte de hospitalidad",
      "image": 'assets/images/B3.png',
    },
    {
      "text": "VETERINARIA",
      "text1": "agregar texto largo para la parte de veterinaria",
      "image": 'assets/images/B4.png',
    },
    {
      "text": "TIENDA",
      "text1": "agregar texto largo para la parte de tienda",
      "image": 'assets/images/B5.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: ColorSelect.paginator,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        page = value;
                      });
                    },
                    controller: pageController,
                    itemCount: onBoardingDatas.length,
                    itemBuilder: (context, index) => ContentBoarding(
                      text: onBoardingDatas[index]["text"]!,
                      text1: onBoardingDatas[index]["text1"]!,
                      image: onBoardingDatas[index]["image"]!,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          onBoardingDatas.length,
                          (index) => newMethod(index: index),
                        ),
                      ),
                    ],
                  ),
                ),
                _buttonBoarding(
                  page,
                  (onBoardingDatas.length - 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AnimatedContainer newMethod({required int index}) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      margin: const EdgeInsets.only(right: 8),
      height: 4,
      width: page == index ? 20 : 20,
      decoration: BoxDecoration(
        color:
            page == index ? ColorSelect.paginatorNext : ColorSelect.paginator,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  _buttonBoarding(int index, int size) {
    return Container(
      height: 50,
      width: 350,
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        color: ColorSelect.btnBackgrounBo1,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: index == size
              ? ColorSelect.borderContainer
              : ColorSelect.btnblack,
        ),
      ),
      child: ElevatedButton(
        onPressed: () {
          if (index == size) {
            showCupertinoModalPopup(
                context: context,
                builder: (context) => const ProgressView("OnBoarding"));
          } else {
            if (index < size && index >= 0) {
              page++;
              setState(() {
                pageController.jumpToPage(page);
              });
            }
          }
        },
        child: Text(
          index == size ? "Continuar" : "Siguiente",
          style: TextStyle(
              color:
                  index == size ? ColorSelect.texButton1 : ColorSelect.btnblack,
              fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          primary: index == size
              ? ColorSelect.borderContainer
              : ColorSelect.btnBackgrounBo1,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}

class ContentBoarding extends StatelessWidget {
  const ContentBoarding({
    Key? key,
    required this.text,
    required this.text1,
    required this.image,
  }) : super(key: key);

  final String text, text1, image;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              image,
              width: 290,
              height: 290,
            ),
            Text(
              text,
              style: const TextStyle(
                color: ColorSelect.txtBoHe,
                fontSize: 21,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                text1,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: ColorSelect.txtBoSubHe,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
