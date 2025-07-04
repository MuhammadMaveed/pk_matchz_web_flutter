import 'package:flutter/material.dart';
import 'package:pk_matchz_web/common/utils/colors.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isMobile = size.width < 768;
    final bool isTablet = size.width >= 768 && size.width < 1024;
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 60,
      ),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            'Why Choose PK Matchz',
            style: TextStyle(
              color: Colors.black87,
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Container(
            constraints: const BoxConstraints(
              maxWidth: 800,
            ),
            child: Text(
              'Discover the features that make PK Matchz the perfect platform for connecting, sharing, and engaging with your community.',
              style: TextStyle(
                color: AppColors.greyColor,
                fontSize: isMobile ? 14 : 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 60),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _buildFeatureCard(
                'Connect with Community',
                'Join a vibrant community of users and connect with like-minded individuals around the world.',
                Icons.people,
                isMobile,
                isTablet,
              ),
              _buildFeatureCard(
                'Share Your Moments',
                'Share your special moments, achievements, and memories with stunning visual content.',
                Icons.photo,
                isMobile,
                isTablet,
              ),
              _buildFeatureCard(
                'Privacy First',
                'Your privacy matters. Control what you share and who can see your content with advanced privacy settings.',
                Icons.lock,
                isMobile,
                isTablet,
              ),
              _buildFeatureCard(
                'Boost Your Reach',
                'Use PK Matchz coins to boost your content and reach a wider audience instantly.',
                Icons.rocket_launch,
                isMobile,
                isTablet,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(
    String title,
    String description,
    IconData iconData,
    bool isMobile,
    bool isTablet,
  ) {
    final cardWidth = isMobile ? double.infinity : (isTablet ? 340.0 : 280.0);
    
    return Container(
      width: cardWidth,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              iconData,
              color: Colors.white,
              size: 28,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(
              color: AppColors.greyColor,
              fontSize: 14,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
