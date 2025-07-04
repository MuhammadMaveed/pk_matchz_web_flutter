import 'package:flutter/material.dart';
import 'package:pk_matchz_web/common/utils/colors.dart';

class CTASection extends StatelessWidget {
  final Function onSignUpPressed;
  
  const CTASection({
    super.key, 
    required this.onSignUpPressed
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isMobile = size.width < 768;
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 60 : 80,
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
            'Ready to Experience PK Matchz?',
            style: TextStyle(
              color: Colors.white,
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Container(
            constraints: BoxConstraints(
              maxWidth: 600,
            ),
            child: Text(
              'Join thousands of users who are already connecting, sharing, and engaging on our platform. Start your journey today!',
              style: TextStyle(
                color: Colors.white,
                fontSize: isMobile ? 14 : 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton(
                'Sign Up Now',
                Colors.white,
                AppColors.primaryColor,
                onSignUpPressed,
              ),
              const SizedBox(width: 16),
              _buildButton(
                'Learn More',
                Colors.transparent,
                Colors.white,
                () {},
                border: true,
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
    Function onTap, {
    bool border = false,
  }) {
    return ElevatedButton(
      onPressed: () => onTap(),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: border ? BorderSide(color: Colors.white, width: 1) : BorderSide.none,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }
}
