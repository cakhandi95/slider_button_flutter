import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slider_button_component/slider_button_component.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {

  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Center (
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center (
                child: ButtonSlideComponent(
                  width: MediaQuery.of(context).size.width - 15,
                  vibrationFlag: true,
                  icon: Container (
                    width: 24.0,  // Set the width of the circle
                    height: 24.0, // Set the height of the circle
                    decoration: const BoxDecoration(
                      color: Colors.white, // Set the color of the circle
                      shape: BoxShape.circle, // Set the shape of the container to a circle
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26, // Color of the shadow
                          blurRadius: 10.0, // Blur radius of the shadow
                          offset: Offset(0, 5), // Offset of the shadow
                        ),
                      ],
                    ),
                    child: const Icon(Icons.ac_unit_sharp),
                  ),
                  label: Text(
                    'Slide to Submit',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      height: 20 / 14,
                      letterSpacing: 0.1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onSlideCompleted: () {
                    debugPrint('item completed');
                  },
                )),
          ],
        ),
      ),
    );
  }
}
