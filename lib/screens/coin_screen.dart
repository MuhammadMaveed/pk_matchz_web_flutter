import 'package:flutter/material.dart';
import 'package:pk_matchz_web/common/utils/colors.dart';
import 'package:pk_matchz_web/widgets/navbar.dart';
import 'package:pk_matchz_web/widgets/footer.dart';


enum PaymentType { stripe, coinbase }

class CoinScreen extends StatefulWidget {
  const CoinScreen({super.key});

  @override
  State<CoinScreen> createState() => _CoinScreenState();
}

class _CoinScreenState extends State<CoinScreen> {
  String? _selectedPackage;
  bool _isProcessingPayment = false;
  PaymentType _selectedPaymentType = PaymentType.stripe;

  void _selectPackage(String packageTitle) {
    setState(() {
      _selectedPackage = packageTitle;
    });
  }

  void _selectPaymentType(PaymentType type) {
    setState(() {
      _selectedPaymentType = type;
    });
  }

  // Future<void> _processPayment() async {
  //   if (_selectedPackage == null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Please select a coin package first')),
  //     );
  //     return;
  //   }
  //
  //   // Check if user is logged in
  //   if (FirebaseAuth.instance.currentUser == null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Please log in to purchase coins')),
  //     );
  //     return;
  //   }
  //
  //   // Get package details
  //   final packageDetails = _getPackageDetails(_selectedPackage!);
  //   if (packageDetails == null) return;
  //
  //   setState(() {
  //     _isProcessingPayment = true;
  //   });
  //
  //   try {
  //     bool success;
  //     if (_selectedPaymentType == PaymentType.stripe) {
  //       // Process Stripe payment
  //       success = await PaymentService.processStripePayment(
  //         packageTitle: packageDetails['title'] as String,
  //         coins: packageDetails['coins'] as int,
  //         amount: packageDetails['price'] as double,
  //         context: context,
  //       );
  //     } else {
  //       // Process Coinbase payment
  //       success = await PaymentService.processCoinbasePayment(
  //         packageTitle: packageDetails['title'] as String,
  //         coins: packageDetails['coins'] as int,
  //         amount: packageDetails['price'] as double,
  //         context: context,
  //       );
  //     }
  //
  //     if (success && mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('Payment processed successfully!')),
  //       );
  //     }
  //   } catch (e) {
  //     if (mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Payment error: $e')),
  //       );
  //     }
  //   } finally {
  //     if (mounted) {
  //       setState(() {
  //         _isProcessingPayment = false;
  //       });
  //     }
  //   }
  // }

  Map<String, dynamic>? _getPackageDetails(String title) {
    switch (title) {
      case 'Basic Pack':
        return {'title': title, 'coins': 100, 'price': 4.99};
      case 'Standard Pack':
        return {'title': title, 'coins': 500, 'price': 19.99};
      case 'Premium Pack':
        return {'title': title, 'coins': 1200, 'price': 39.99};
      case 'Ultimate Pack':
        return {'title': title, 'coins': 3000, 'price': 89.99};
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isMobile = size.width < 768;
    final bool isTablet = size.width >= 768 && size.width < 1024;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Navbar with back button
            Navbar(
              onLoginPressed: () {
                // Handle login press
              },
            ),
            
            // Coins Content
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                width: isMobile ? size.width * 0.9 : (isTablet ? 700 : 900),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PK Matchz Coins',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: isMobile ? 24 : 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Purchase coins to boost your content, unlock premium features, and enhance your experience on PK Matchz.',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 32),
                    isMobile 
                      ? _buildMobileCoinsPackages() 
                      : _buildDesktopCoinsPackages(),
                    const SizedBox(height: 24),
                    _buildPaymentOptions(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            
            // Footer
            const Footer(),
            
            // Debug button in development mode (remove in production)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Opacity(
                opacity: 0.5,
                child: ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade800,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Test Payment Integration'),
                ),
              ),
            ),
          ],
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

  Widget _buildPaymentOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Payment Method',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _buildPaymentOption(
              'Credit Card',
              Icons.credit_card,
              PaymentType.stripe,
              _selectedPaymentType == PaymentType.stripe,
            ),
            const SizedBox(width: 16),
            _buildPaymentOption(
              'Cryptocurrency',
              Icons.currency_bitcoin,
              PaymentType.coinbase,
              _selectedPaymentType == PaymentType.coinbase,
            ),
          ],
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              disabledBackgroundColor: AppColors.primaryColor.withOpacity(0.5),
            ),
            child: _isProcessingPayment
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : const Text(
                    'Purchase Selected Package',
                    style: TextStyle(fontSize: 16),
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentOption(
    String name,
    IconData icon,
    PaymentType type,
    bool isSelected,
  ) {
    return Expanded(
      child: InkWell(
        onTap: () => _selectPaymentType(type),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected
                  ? AppColors.primaryColor
                  : Colors.grey.shade300,
              width: isSelected ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(8),
            color: isSelected
                ? AppColors.primaryColor.withOpacity(0.1)
                : Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,
                  color:
                      isSelected ? AppColors.primaryColor : Colors.grey.shade600),
              const SizedBox(width: 8),
              Text(
                name,
                style: TextStyle(
                  color: isSelected
                      ? AppColors.primaryColor
                      : Colors.grey.shade600,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCoinPackage(String title, String coins, double price, bool isMostPopular) {
    final bool isSelected = _selectedPackage == title;
    
    return GestureDetector(
      onTap: () => _selectPackage(title),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: isSelected || isMostPopular 
              ? Border.all(
                  color: isSelected ? AppColors.primaryColor : AppColors.primaryColor,
                  width: isSelected ? 3 : 2
                )
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
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
            child: OutlinedButton(
              onPressed: () => _selectPackage(title),
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: isSelected ? AppColors.primaryColor : Colors.grey.shade300,
                ),
                foregroundColor: isSelected ? AppColors.primaryColor : Colors.grey.shade700,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: isSelected ? AppColors.primaryColor.withOpacity(0.1) : Colors.white,
              ),
              child: Text(isSelected ? 'Selected' : 'Select'),
            ),
          ),
        ],
      ),
      )
    );
  }
}
