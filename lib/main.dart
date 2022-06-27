import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GetMaterialApp(
      title: "FireFolio",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      customTransition: _CustomTransition(),
      theme: ThemeData(
        useMaterial3: true,
      ),
    ),
  );
}

class _CustomTransition extends CustomTransition {
  final _routes = Get.routeTree.routes;

  @override
  Widget buildTransition(
    BuildContext context,
    Curve? curve,
    Alignment? alignment,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return Stack(
      children: [
        SlideTransition(
          position: Tween(
            begin: Offset.zero,
            end: const Offset(-1, 0),
          ).animate(animation),
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, .003)
              ..rotateY(pi / 2 * animation.value),
            alignment: FractionalOffset.centerRight,
            child: _routes[_routes.length - 2].page(),
          ),
        ),
        SlideTransition(
          position: Tween(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.003)
              ..rotateY(pi / 2 * (animation.value - 1)),
            alignment: FractionalOffset.centerLeft,
            child: child,
          ),
        )
      ],
    );
  }
}
