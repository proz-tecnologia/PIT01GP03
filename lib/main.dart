import 'package:flutter/material.dart';
import 'package:porkinio/locator.dart';
import 'package:porkinio/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupDependencies();
  runApp(
    const MyApp(),
  );
}
