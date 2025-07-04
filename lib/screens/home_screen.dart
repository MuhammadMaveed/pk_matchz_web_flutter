import 'package:flutter/material.dart';
import 'package:pk_matchz_web/common/utils/colors.dart';
import 'package:pk_matchz_web/common/utils/gradients.dart';
import 'package:pk_matchz_web/widgets/navbar.dart';
import 'package:pk_matchz_web/widgets/hero_section.dart';
import 'package:pk_matchz_web/widgets/features_section.dart';
import 'package:pk_matchz_web/widgets/testimonials_section.dart';
import 'package:pk_matchz_web/widgets/cta_section.dart';
import 'package:pk_matchz_web/widgets/footer.dart';
import 'package:pk_matchz_web/widgets/login_modal.dart';
import 'package:pk_matchz_web/screens/coin_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showLoginModal = false;
  
  void _toggleLoginModal() {
    setState(() {
      _showLoginModal = !_showLoginModal;
    });
  }
  
  void _navigateToCoinsScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CoinScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Navbar
                Navbar(onLoginPressed: _toggleLoginModal),
                
                // Hero Section
                HeroSection(
                  onCoinsPressed: _navigateToCoinsScreen,
                ),
                
                // Features Section
                const FeaturesSection(),
                
                // Testimonials Section
                const TestimonialsSection(),
                
                // CTA Section
                CTASection(
                  onSignUpPressed: _toggleLoginModal,
                ),
                
                // Footer
                const Footer(),
              ],
            ),
          ),
          
          // Conditional display of login modal
          if (_showLoginModal)
            LoginModal(onClose: _toggleLoginModal),
        ],
      ),
    );
  }
  
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
