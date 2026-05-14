import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/fantasy_colors.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _fairyAnimationController;
  late Animation<double> _fairyFadeAnimation;
  late Animation<double> _fairyScaleAnimation;
  late Animation<double> _portalPulseAnimation;
  
  bool _fairyEntered = false;
  bool _portalActive = false;

  @override
  void initState() {
    super.initState();

    // Animazione della fatina che entra nel portale
    _fairyAnimationController = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    _fairyFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _fairyAnimationController,
        curve: const Interval(0.0, 0.3, curve: Curves.easeIn),
      ),
    );

    _fairyScaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _fairyAnimationController,
        curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
      ),
    );

    _portalPulseAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: _fairyAnimationController,
        curve: const Interval(0.3, 1.0, curve: Curves.easeInOut),
      ),
    );

    // Avvia l'animazione della fatina
    _fairyAnimationController.forward().then((_) {
      setState(() {
        _fairyEntered = true;
        _portalActive = true;
      });
    });
  }

  @override
  void dispose() {
    _fairyAnimationController.dispose();
    super.dispose();
  }

  void _enterPortal() {
    if (!_portalActive) return;
    
    Navigator.of(context).pushReplacementNamed('/splash');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              FantasyColors.deepPurple,
              FantasyColors.darkPurple,
              FantasyColors.darkBackground,
            ],
          ),
        ),
        child: Stack(
          children: [
            // Sfondo decorativo con pattern
            Positioned.fill(
              child: Opacity(
                opacity: 0.05,
                child: SvgPicture.asset(
                  'assets/svg/backgrounds/pattern.svg',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Particelle magiche di sfondo
            ..._buildMagicParticles(),

            // Contenuto centrale
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 2),

                  // Titolo di benvenuto
                  FadeTransition(
                    opacity: _fairyFadeAnimation,
                    child: const Text(
                      'Benvenuto nell\'Avventura',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: FantasyColors.gold,
                        fontFamily: 'GameFont',
                        letterSpacing: 2,
                        shadows: [
                          Shadow(
                            color: FantasyColors.deepRed,
                            offset: Offset(2, 2),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Sottotitolo
                  FadeTransition(
                    opacity: _fairyFadeAnimation,
                    child: const Text(
                      'Un mondo magico ti attende',
                      style: TextStyle(
                        fontSize: 18,
                        color: FantasyColors.cream,
                        fontFamily: 'GameFont',
                        letterSpacing: 1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const Spacer(flex: 1),

                  // Portale magico animato
                  AnimatedBuilder(
                    animation: _portalPulseAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _portalActive ? _portalPulseAnimation.value : 1.0,
                        child: GestureDetector(
                          onTap: _enterPortal,
                          child: Container(
                            width: 280,
                            height: 280,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: _portalActive
                                  ? [
                                      BoxShadow(
                                        color: FantasyColors.purple.withOpacity(0.6),
                                        blurRadius: 40,
                                        spreadRadius: 15,
                                      ),
                                      BoxShadow(
                                        color: FantasyColors.gold.withOpacity(0.4),
                                        blurRadius: 30,
                                        spreadRadius: 10,
                                      ),
                                    ]
                                  : [],
                            ),
                            child: SvgPicture.asset(
                              'assets/svg/backgrounds/magic_portal.svg',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 40),

                  // Fatina che vola verso il portale
                  if (!_fairyEntered)
                    FadeTransition(
                      opacity: _fairyFadeAnimation,
                      child: ScaleTransition(
                        scale: _fairyScaleAnimation,
                        child: SizedBox(
                          width: 150,
                          height: 200,
                          child: SvgPicture.asset(
                            'assets/svg/icons/fairy.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),

                  const Spacer(flex: 1),

                  // Istruzioni per entrare
                  if (_portalActive)
                    FadeTransition(
                      opacity: _fairyFadeAnimation,
                      child: Column(
                        children: [
                          const Text(
                            'Tocca il portale per iniziare',
                            style: TextStyle(
                              fontSize: 16,
                              color: FantasyColors.amber,
                              fontFamily: 'GameFont',
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Icon(
                            Icons.touch_app,
                            color: FantasyColors.gold.withOpacity(0.8),
                            size: 32,
                          ),
                        ],
                      ),
                    ),

                  const Spacer(flex: 2),
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
      ),
    );
  }

  List<Widget> _buildMagicParticles() {
    return List.generate(20, (index) {
      return TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: Duration(milliseconds: 1500 + (index * 200)),
        builder: (context, value, child) {
          return Positioned(
            left: (index * 57) % MediaQuery.of(context).size.width.toDouble(),
            top: (index * 73) % MediaQuery.of(context).size.height.toDouble(),
            child: Opacity(
              opacity: value * 0.3,
              child: Container(
                width: 4 + (index % 3),
                height: 4 + (index % 3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index % 3 == 0
                      ? FantasyColors.gold
                      : index % 3 == 1
                          ? FantasyColors.amber
                          : FantasyColors.purple,
                ),
              ),
            ),
          );
        },
      );
    });
  }

  Widget _buildCornerDecoration() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: FantasyColors.gold.withOpacity(0.5), width: 2),
          left: BorderSide(color: FantasyColors.gold.withOpacity(0.5), width: 2),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: FantasyColors.amber,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
