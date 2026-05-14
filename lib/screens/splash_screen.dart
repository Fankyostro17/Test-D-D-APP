import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:async';
import '../utils/fantasy_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    // Setup animazioni immediatamente
    _setupAnimations();
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.elasticOut),
      ),
    );

    _rotationAnimation = Tween<double>(begin: 0.0, end: 2 * 3.14159).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.3, 0.8, curve: Curves.easeInOut),
      ),
    );

    _animationController.forward();

    // Simula caricamento risorse
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            FantasyColors.deepPurple,
            FantasyColors.darkBackground,
            FantasyColors.forestGreen,
          ],
        ),
      ),
      child: Stack(
        children: [
          // Sfondo decorativo con pattern
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: SvgPicture.asset(
                'assets/svg/backgrounds/pattern.svg',
                fit: BoxFit.cover,
                cacheColorFilter: true,
              ),
            ),
          ),

          // Contenuto centrale
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo/Icona principale animata
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _rotationAnimation.value,
                      child: Transform.scale(
                        scale: _scaleAnimation.value,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const RadialGradient(
                              colors: [
                                FantasyColors.gold,
                                FantasyColors.amber,
                                FantasyColors.deepRed,
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: FantasyColors.gold.withOpacity(0.6),
                                blurRadius: 30,
                                spreadRadius: 10,
                              ),
                            ],
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/svg/dice/d20.svg',
                              width: 100,
                              height: 100,
                              colorFilter: const ColorFilter.mode(
                                FantasyColors.cream,
                                BlendMode.srcIn,
                              ),
                              cacheColorFilter: true,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 40),

                // Titolo dell'app
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: const Text(
                    'TTRPG Companion',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: FantasyColors.gold,
                      fontFamily: 'GameFont',
                      letterSpacing: 2,
                      shadows: [
                        Shadow(
                          color: FantasyColors.deepRed,
                          offset: Offset(2, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Sottotitolo
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: const Text(
                    'Your Adventure Awaits',
                    style: TextStyle(
                      fontSize: 18,
                      color: FantasyColors.cream,
                      fontFamily: 'GameFont',
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 60),

                // Indicatore di caricamento
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SizedBox(
                    width: 200,
                    child: Column(
                      children: [
                        LinearProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FantasyColors.gold,
                          ),
                          backgroundColor: FantasyColors.darkPurple,
                          minHeight: 4,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Loading...',
                          style: TextStyle(
                            color: FantasyColors.cream,
                            fontFamily: 'GameFont',
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Decorazioni angolari
          Positioned(
            top: 20,
            left: 20,
            child: _buildCornerDecoration(),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: _buildCornerDecoration(),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: _buildCornerDecoration(),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: _buildCornerDecoration(),
          ),
        ],
      ),
    );
  }

  Widget _buildCornerDecoration() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: FantasyColors.gold, width: 2),
          left: BorderSide(color: FantasyColors.gold, width: 2),
        ),
      ),
    );
  }
}
