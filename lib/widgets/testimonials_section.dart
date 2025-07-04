import 'package:flutter/material.dart';
import 'package:pk_matchz_web/common/utils/colors.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

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
      color: Colors.grey[50],
      child: Column(
        children: [
          Text(
            'What Our Users Say',
            style: TextStyle(
              color: Colors.black87,
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _buildTestimonialCard(
                '"PK Matchz has transformed the way I connect with others. The platform is intuitive, engaging, and the coin system adds a fun element to interactions."',
                'Ahmed Khan',
                'Regular User',
                isMobile,
                isTablet,
              ),
              _buildTestimonialCard(
                '"I\'ve been using PK Matchz for six months now, and the community here is amazing. The privacy features make me feel secure while sharing my content."',
                'Sara Ali',
                'Content Creator',
                isMobile,
                isTablet,
              ),
              _buildTestimonialCard(
                '"The boost feature using coins has helped me reach a wider audience with my photography. Worth every coin spent!"',
                'Hamza Malik',
                'Photographer',
                isMobile,
                isTablet,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialCard(
    String testimonial,
    String name,
    String title,
    bool isMobile,
    bool isTablet,
  ) {
    final cardWidth = isMobile ? double.infinity : (isTablet ? 340.0 : 320.0);
    
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            testimonial,
            style: TextStyle(
              color: AppColors.greyColor,
              fontSize: 14,
              height: 1.6,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              color: AppColors.greyColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
