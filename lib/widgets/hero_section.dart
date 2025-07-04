import 'package:flutter/material.dart';
import 'package:pk_matchz_web/common/utils/colors.dart';
import 'package:pk_matchz_web/common/utils/gradients.dart';

class HeroSection extends StatelessWidget {
  final Function onCoinsPressed;
  
  const HeroSection({
    super.key, 
    required this.onCoinsPressed,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isMobile = size.width < 768;
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primaryColor,
            AppColors.primaryColor.withOpacity(0.8),
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            'Welcome to PK Matchz',
            style: TextStyle(
              color: Colors.white,
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Container(
            constraints: BoxConstraints(
              maxWidth: 600,
            ),
            child: Text(
              'Connect with a vibrant community, share your moments, and engage with content that matters to you.',
              style: TextStyle(
                color: Colors.white,
                fontSize: isMobile ? 16 : 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton(
                'Get Started',
                AppColors.whiteColor,
                AppColors.primaryColor,
                () {},
              ),
              const SizedBox(width: 16),
              _buildButton(
                'Buy Coins',
                AppColors.primaryColor,
                AppColors.whiteColor,
                onCoinsPressed,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
    String label,
    Color backgroundColor,
    Color textColor,
    Function onTap,
  ) {
    return ElevatedButton(
      onPressed: () => onTap(),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}
