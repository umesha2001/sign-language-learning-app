import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/colors.dart';
import 'choose_way_screen.dart';

class ConvertScreen extends StatefulWidget {
  final ConversionMode mode;

  const ConvertScreen({Key? key, required this.mode}) : super(key: key);

  @override
  _ConvertScreenState createState() => _ConvertScreenState();
}

class _ConvertScreenState extends State<ConvertScreen> {
  bool isRecording = false;
  String inputText = '';
  bool isTextMode = true;

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
          'Convert To',
          style: GoogleFonts.poppins(
            color: AppColors.dark,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Camera/Image Display Area
          Expanded(
            flex: 2,
            child: Container(
              color: AppColors.primaryLight,
              child: Center(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.person,
                      size: 100,
                      color: AppColors.lavender,
                    ),
                  ),
                ),
              ),
            ),
          ),
          
          // Controls Section
          Expanded(
            flex: 1,
            child: Container(
              color: AppColors.white,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Mode Toggle Buttons
                  Row(
                    children: [
                      Expanded(
                        child: _ModeButton(
                          icon: Icons.camera_alt,
                          isSelected: !isTextMode,
                          onTap: () {
                            setState(() {
                              isTextMode = false;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Record Button
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isRecording ? AppColors.error : AppColors.error,
                        ),
                        child: IconButton(
                          icon: Icon(
                            isRecording ? Icons.stop : Icons.fiber_manual_record,
                            color: AppColors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            setState(() {
                              isRecording = !isRecording;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _ModeButton(
                          icon: Icons.text_fields,
                          label: '[REC]',
                          isSelected: false,
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Text/Voice Mode Buttons
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              isTextMode = true;
                            });
                          },
                          icon: const Icon(Icons.keyboard),
                          label: Text(
                            'Text',
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isTextMode ? AppColors.buttonPurple : AppColors.lavender,
                            foregroundColor: AppColors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              isTextMode = false;
                            });
                          },
                          icon: const Icon(Icons.mic),
                          label: Text(
                            'Voice',
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: !isTextMode ? AppColors.buttonPurple : AppColors.lavender,
                            foregroundColor: AppColors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  // Text Input Field
                  if (isTextMode) ...[
                    const SizedBox(height: 16),
                    Container(
                      height: 80,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.lavender),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: 'Type your text here...',
                          border: InputBorder.none,
                          hintStyle: GoogleFonts.poppins(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            inputText = value;
                          });
                        },
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ModeButton extends StatelessWidget {
  final IconData icon;
  final String? label;
  final bool isSelected;
  final VoidCallback onTap;

  const _ModeButton({
    required this.icon,
    this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.lavender : AppColors.lavender.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: AppColors.white,
              size: 24,
            ),
            if (label != null) ...[
              const SizedBox(height: 4),
              Text(
                label!,
                style: GoogleFonts.poppins(
                  color: AppColors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
