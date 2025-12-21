import 'package:flutter/material.dart';
import '../core/constants/colors.dart';

class AvatarSelector extends StatelessWidget {
  final String? selectedAvatar;
  final VoidCallback onTap;
  final double size;

  const AvatarSelector({
    Key? key,
    this.selectedAvatar,
    required this.onTap,
    this.size = 120,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: AppColors.lavender.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: Stack(
          children: [
            Center(
              child: selectedAvatar != null
                  ? ClipOval(
                      child: Image.asset(
                        selectedAvatar!,
                        width: size - 10,
                        height: size - 10,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Icon(
                      Icons.person,
                      size: size * 0.6,
                      color: AppColors.lavender,
                    ),
            ),
            Positioned(
              bottom: 5,
              right: 5,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: AppColors.primaryDark,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.camera_alt,
                  size: 20,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
