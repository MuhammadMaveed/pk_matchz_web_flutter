import 'package:flutter/material.dart';
import 'package:pk_matchz_web/common/utils/colors.dart';

class CoinsSection extends StatelessWidget {
  final Function onClose;

  const CoinsSection({
    super.key,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isMobile = size.width < 768;
    final bool isTablet = size.width >= 768 && size.width < 1024;

    return Material(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: Container(
          width: isMobile ? size.width * 0.9 : (isTablet ? 700 : 900),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'PK Matchz Coins',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isMobile ? 24 : 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () => onClose(),
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Purchase coins to boost your content, unlock premium features, and enhance your experience on PK Matchz.',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 32),
              isMobile 
                ? _buildMobileCoinsPackages() 
                : _buildDesktopCoinsPackages(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileCoinsPackages() {
    return Column(
      children: [
        _buildCoinPackage('Basic Pack', '100 Coins', 4.99, false),
        const SizedBox(height: 16),
        _buildCoinPackage('Standard Pack', '500 Coins', 19.99, true),
        const SizedBox(height: 16),
        _buildCoinPackage('Premium Pack', '1200 Coins', 39.99, false),
        const SizedBox(height: 16),
        _buildCoinPackage('Ultimate Pack', '3000 Coins', 89.99, false),
      ],
    );
  }

  Widget _buildDesktopCoinsPackages() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: _buildCoinPackage('Basic Pack', '100 Coins', 4.99, false)),
        const SizedBox(width: 16),
        Expanded(child: _buildCoinPackage('Standard Pack', '500 Coins', 19.99, true)),
        const SizedBox(width: 16),
        Expanded(child: _buildCoinPackage('Premium Pack', '1200 Coins', 39.99, false)),
        const SizedBox(width: 16),
        Expanded(child: _buildCoinPackage('Ultimate Pack', '3000 Coins', 89.99, false)),
      ],
    );
  }

  Widget _buildCoinPackage(String title, String coins, double price, bool isMostPopular) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: isMostPopular 
            ? Border.all(color: AppColors.primaryColor, width: 2)
            : null,
      ),
      child: Column(
        children: [
          if (isMostPopular)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'Most Popular',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          if (isMostPopular)
            const SizedBox(height: 16),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              title.contains('Basic') ? Icons.monetization_on 
                : title.contains('Standard') ? Icons.star
                : title.contains('Premium') ? Icons.rocket_launch
                : Icons.workspace_premium,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            coins,
            style: TextStyle(
              fontSize: 16,
              color: AppColors.greyColor,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '\$${price.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Purchase Now'),
            ),
          ),
        ],
      ),
    );
  }
}
