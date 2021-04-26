import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unico_check_example/screens/acesso_bio_camera/acesso_bio_camera.controller.dart';

class AcessoBioCameraScreen extends GetView<AcessoBioCameraController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: controller.openCamera,
          icon: Icon(Icons.camera, size: 18),
          label: Text('Abrir a camera da UNICO'),
        ),
        const SizedBox(height: 30),
        ElevatedButton.icon(
          onPressed: controller.openCameraOnline,
          icon: Icon(Icons.online_prediction, size: 18),
          label: Text('Abrir a camera da UNICO criando Processo'),
        ),
      ],
    );
  }
}
