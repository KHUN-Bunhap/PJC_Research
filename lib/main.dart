import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'view_model/Main/main.dart' as main_view;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Hide system UI (status bar and navigation bar)
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
    overlays: [],
  );

  runApp(
    MaterialApp(
      title: 'Post-Pandemic Learning Era',
      home: const main_view.View(),
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
        fontFamily: 'Archane',
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
/*
git add .
git commit -m "Update website"
git push

*/