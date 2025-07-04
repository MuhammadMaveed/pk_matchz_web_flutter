import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pk_matchz_web/common/utils/colors.dart';

class Navbar extends StatefulWidget {
  final Function onLoginPressed;

  const Navbar({super.key, required this.onLoginPressed});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  bool _isMobile = false;
  bool _isMenuOpen = false;
  String? userId;
  String? _userCoins;

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        userId = user.uid;
      });
      _fetchUserCoins();
    } else {
      print('❌ User not logged in');
    }
  }

  Future<void> _fetchUserCoins() async {
    try {
      print('🔍 Fetching coins for UID: $userId');
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (doc.exists && doc.data() != null) {
        final data = doc.data();
        print('📄 Firestore doc data: $data');

        if (data!.containsKey('coins')) {
          setState(() {
            _userCoins = data['coins'].toString(); // ✅ Ensure it's string
          });
          print('✅ Coins fetched: $_userCoins');
        } else {
          print('⚠️ "coins" field not found');
        }
      } else {
        print('⚠️ Document not found for UID $userId');
      }
    } catch (e) {
      print("🔥 Error fetching coins: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    _isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: _isMobile ? 20 : 80,
        vertical: 16,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: _isMobile ? _buildMobileNavbar() : _buildDesktopNavbar(),
    );
  }

  Widget _buildDesktopNavbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLogo(),
        Row(
          children: [
            _buildNavItem('Home', true),
            const SizedBox(width: 32),
            _buildNavItem('About', false),
            const SizedBox(width: 32),
            _buildNavItem('Coins', false),
            const SizedBox(width: 32),
            _buildNavItem('Contact', false),
            const SizedBox(width: 32),
            userId != null ? _buildCoinContainer() : _buildLoginButton(),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileNavbar() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildLogo(),
            IconButton(
              icon: Icon(_isMenuOpen ? Icons.close : Icons.menu),
              onPressed: () {
                setState(() {
                  _isMenuOpen = !_isMenuOpen;
                });
              },
            ),
          ],
        ),
        if (_isMenuOpen)
          Column(
            children: [
              const SizedBox(height: 16),
              _buildNavItem('Home', true),
              const SizedBox(height: 16),
              _buildNavItem('About', false),
              const SizedBox(height: 16),
              _buildNavItem('Coins', false),
              const SizedBox(height: 16),
              _buildNavItem('Contact', false),
              const SizedBox(height: 16),
              userId != null ? _buildCoinContainer() : _buildLoginButton(),
              const SizedBox(height: 16),
            ],
          ),
      ],
    );
  }

  Widget _buildLogo() {
    return Row(
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
    );
  }

  Widget _buildNavItem(String title, bool isActive) {
    return InkWell(
      onTap: () {},
      child: Text(
        title,
        style: TextStyle(
          color: isActive ? AppColors.primaryColor : AppColors.greyColor,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () => widget.onLoginPressed(),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: const Text(
        'Log In',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildCoinContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primaryColor),
      ),
      child: Row(
        children: [
          const Icon(Icons.monetization_on, size: 20, color: Colors.orange),
          const SizedBox(width: 8),
          Text(
            _userCoins != null ? 'Coins: $_userCoins' : 'Loading...',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
