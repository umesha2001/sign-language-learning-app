import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../home/home_screen.dart';
import '../../core/constants/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              
              // Logo Circle
              Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x33000000),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Image.asset(
                    'assets/icons/Home logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Tagline
              Text(
                'Your Gateway to',
                textAlign: TextAlign.center,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppColors.dark,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                'Mastering',
                textAlign: TextAlign.center,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppColors.dark,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                'Sign Language!',
                textAlign: TextAlign.center,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppColors.dark,
                  fontStyle: FontStyle.italic,
                ),
              ),
              
              const Spacer(),
              
              // Get Started Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.dark,
                    foregroundColor: AppColors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Get Started',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}