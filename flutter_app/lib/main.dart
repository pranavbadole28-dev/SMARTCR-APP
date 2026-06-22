import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SmartCryApp());
}

class SmartCryApp extends StatelessWidget {
  const SmartCryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartCry',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,

        brightness: Brightness.dark,

        fontFamily: 'Poppins',

        scaffoldBackgroundColor: const Color(0xFF050816),

        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF4F8CFF),
          secondary: Color(0xFF00E5FF),
          surface: Color(0xFF0B1220),
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
        ),

        cardTheme: CardThemeData(
          color: const Color(0xFF0E1728),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),

      home: const HomeScreen(),
    );
  }
}