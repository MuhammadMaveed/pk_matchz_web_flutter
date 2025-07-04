import 'package:flutter/material.dart';
import 'package:pk_matchz_web/common/utils/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isMobile = size.width < 768;
    final bool isTablet = size.width >= 768 && size.width < 1024;
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 40,
      ),
      color: Colors.white,
      child: Column(
        children: [
          isMobile 
            ? _buildMobileFooter() 
            : _buildDesktopFooter(isTablet),
          const SizedBox(height: 40),
          const Divider(),
          const SizedBox(height: 20),
          Text(
            '© 2025 PK Matchz. All rights reserved.',
            style: TextStyle(
              color: AppColors.greyColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopFooter(bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: isTablet ? 3 : 2,
          child: _buildCompanyInfo(),
        ),
        Expanded(
          flex: 1,
          child: _buildFooterLinks('Quick Links', [
            'Home',
            'About Us',
            'Coins',
            'Contact',
          ]),
        ),
        Expanded(
          flex: 1,
          child: _buildFooterLinks('Legal', [
            'Terms & Conditions',
            'Privacy Policy',
            'Cookies Policy',
          ]),
        ),
        Expanded(
          flex: isTablet ? 2 : 1,
          child: _buildContactInfo(),
        ),
      ],
    );
  }

  Widget _buildMobileFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCompanyInfo(),
        const SizedBox(height: 30),
        _buildFooterLinks('Quick Links', [
          'Home',
          'About Us',
          'Coins',
          'Contact',
        ]),
        const SizedBox(height: 30),
        _buildFooterLinks('Legal', [
          'Terms & Conditions',
          'Privacy Policy',
          'Cookies Policy',
        ]),
        const SizedBox(height: 30),
        _buildContactInfo(),
      ],
    );
  }

  Widget _buildCompanyInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'PK',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Matchz',
              style: TextStyle(
                color: AppColors.greyColor,
                fontSize: 24,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          'Connect, share, and engage with our vibrant community.',
          style: TextStyle(
            color: AppColors.greyColor,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _buildSocialIcon(Icons.telegram),
            const SizedBox(width: 16),
            _buildSocialIcon(Icons.facebook),
            const SizedBox(width: 16),
            _buildSocialIcon(Icons.camera_alt),
            const SizedBox(width: 16),
            _buildSocialIcon(Icons.linked_camera),
          ],
        ),
      ],
    );
  }

  Widget _buildFooterLinks(String title, List<String> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        ...links.map((link) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: InkWell(
            onTap: () {},
            child: Text(
              link,
              style: TextStyle(
                color: AppColors.greyColor,
                fontSize: 14,
              ),
            ),
          ),
        )).toList(),
      ],
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Us',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _buildContactItem(Icons.email, 'Email: info@pkmatchz.com'),
        const SizedBox(height: 12),
        _buildContactItem(Icons.phone, 'Phone: +92 123 456 7890'),
        const SizedBox(height: 12),
        _buildContactItem(Icons.location_on, 'Address: Main Street, Lahore, Pakistan'),
      ],
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: AppColors.greyColor,
          size: 16,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.greyColor,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: AppColors.greyColor.withOpacity(0.3),
        ),
      ),
      child: Icon(
        icon,
        color: AppColors.greyColor,
        size: 16,
      ),
    );
  }
}
