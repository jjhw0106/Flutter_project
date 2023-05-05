import 'package:flutter/material.dart';

class MyNoteController {
  late final TextEditingController contentsController;

  void onInit() {
    contentsController = TextEditingController();
  }
}