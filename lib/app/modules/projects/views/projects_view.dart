import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/projects_controller.dart';

class ProjectsView extends GetView<ProjectsController> {
  const ProjectsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProjectsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProjectsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
