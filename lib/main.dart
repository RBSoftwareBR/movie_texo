import 'package:flutter/material.dart';
import 'package:movie_texo/presentation/app.dart';
import 'package:movie_texo/presentation/injection_container.dart';

void main() {
  setUpServiceLocator();
  runApp(const MovieApp());
}
