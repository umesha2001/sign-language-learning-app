import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/colors.dart';

class CharacterCustomizationScreen extends StatefulWidget {
  const CharacterCustomizationScreen({Key? key}) : super(key: key);

  @override
  _CharacterCustomizationScreenState createState() => _CharacterCustomizationScreenState();
}

class _CharacterCustomizationScreenState extends State<CharacterCustomizationScreen> {
  int selectedAvatarIndex = 0;

  final List<Map<String, dynamic>> avatars = [
    {'icon': Icons.person, 'color': Color(0xFF8B7A9E)},
    {'icon': Icons.person, 'color': Color(0xFF6B5B7B)},
    {'icon': Icons.person, 'color': Color(0xFFB4A5C6)},
    {'icon': Icons.person, 'color': Color(0xFF9B8BA8)},
    {'icon': Icons.person, 'color': Color(0xFFC4A4D6)},
    {'icon': Icons.person, 'color': Color(0xFF7B6B8B)},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryLight,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.dark),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Customize Your Character',
          style: GoogleFonts.poppins(
            color: AppColors.dark,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primaryLight,
              AppColors.white,
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 40),
            
            // Main Avatar Display
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: avatars[selectedAvatarIndex]['color'],
                shape: BoxShape.circle,
              ),
              child: Icon(
                avatars[selectedAvatarIndex]['icon'],
                size: 100,
                color: AppColors.white,
              ),
            ),
            
            const SizedBox(height: 60),
            
            // Avatar Selection Grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 1,
                  ),
                  itemCount: avatars.length,
                  itemBuilder: (context, index) {
                    final avatar = avatars[index];
                    final isSelected = index == selectedAvatarIndex;
                    
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedAvatarIndex = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: avatar['color'],
                          shape: BoxShape.circle,
                          border: isSelected
                              ? Border.all(color: AppColors.dark, width: 3)
                              : null,
                        ),
                        child: Icon(
                          avatar['icon'],
                          size: 50,
                          color: AppColors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
