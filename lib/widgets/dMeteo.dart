import 'package:flutter/material.dart';
import 'package:dmeteo/resources/colors.dart';

/// <summary>
/// Main app widget for DMeteo.
/// </summary>
class DMeteo extends StatelessWidget {
  const DMeteo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide debug banner
      debugShowCheckedModeBanner: false,
      // App title
      title: 'DMeteo',
      // App theme configuration
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background, // Background color
        primaryColor: AppColors.primary, // Primary color
        colorScheme: ColorScheme.fromSeed(
          // Color scheme
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          brightness: Brightness.light,
        ),
        textTheme: const TextTheme(
          // Text styles
          displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          bodyMedium: TextStyle(fontSize: 16, color: AppColors.text),
          labelLarge: TextStyle(fontSize: 14, color: AppColors.text),
        ),
        appBarTheme: const AppBarTheme(
          // AppBar style
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          shadowColor: Colors.black87,
          elevation: 20,
        ),
        cardColor: Colors.white.withOpacity(0.1), // Card color
      ),
      // Main screen
      home: Scaffold(
        appBar: AppBar(title: const Text('DMeteo'), elevation: 30),
        body: Center(child: const Text('Welcome to DMeteo!')),
      ),
    );
  }
}
