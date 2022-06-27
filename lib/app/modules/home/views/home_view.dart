import 'package:firefolio/app/modules/home/controllers/home_controller.dart';
import 'package:firefolio/app/routes/app_pages.dart';
import 'package:firefolio/app/widgets/bouncing_text_widget.dart';
import 'package:firefolio/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mouse_parallax/mouse_parallax.dart';
import 'package:rive/rive.dart' show RiveAnimation;

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ParallaxStack(
        layers: [
          const ParallaxLayer(
            child: RiveAnimation.asset(
              fit: BoxFit.cover,
              'assets/rive/background.riv',
            ),
          ),
          const ParallaxLayer(
            xOffset: 10,
            yOffset: 10,
            child: RiveAnimation.asset(
              fit: BoxFit.cover,
              'assets/rive/stars.riv',
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () => Get.toNamed(Routes.PROJECTS),
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color.fromRGBO(245, 245, 245, .4),
                      Colors.blue.withOpacity(.4),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(
                  Icons.navigate_next,
                  size: 50,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                'Hi,',
                'I\'m Abhi',
                'Flutter Developer',
              ].map((e) => e.toBouncingTextWidgets()).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
