import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../providers/dice_provider.dart';
import '../widgets/svg_dice_button.dart';
import '../widgets/dice_result_display.dart';
import '../utils/fantasy_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DiceRollerScreen(),
    const CharacterListScreen(),
    const CampaignScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              FantasyColors.darkPurple,
              FantasyColors.deepPurple,
              FantasyColors.darkBackground,
            ],
          ),
        ),
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: SvgBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}

class DiceRollerScreen extends StatelessWidget {
  const DiceRollerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DiceProvider>(
      builder: (context, diceProvider, child) {
        return Column(
          children: [
            AppBar(
              title: const Text(
                'Dice Roller',
                style: TextStyle(
                  fontFamily: 'GameFont',
                  color: FantasyColors.gold,
                  letterSpacing: 1,
                ),
              ),
              centerTitle: true,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      FantasyColors.royalPurple,
                      FantasyColors.deepPurple,
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Select a die to roll',
                      style: TextStyle(
                        fontSize: 18,
                        color: FantasyColors.cream,
                        fontFamily: 'GameFont',
                      ),
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      alignment: WrapAlignment.center,
                      children: [
                        SvgDiceButton(diceType: 4),
                        SvgDiceButton(diceType: 6),
                        SvgDiceButton(diceType: 8),
                        SvgDiceButton(diceType: 10),
                        SvgDiceButton(diceType: 12),
                        SvgDiceButton(diceType: 20),
                      ],
                    ),
                    const SizedBox(height: 32),
                    if (diceProvider.rollHistory.isNotEmpty) ...[
                      const Divider(
                        color: FantasyColors.gold,
                        height: 1,
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView.builder(
                          itemCount: diceProvider.rollHistory.length,
                          itemBuilder: (context, index) {
                            final result = diceProvider.rollHistory[index];
                            return DiceResultDisplay(result: result);
                          },
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class CharacterListScreen extends StatelessWidget {
  const CharacterListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Characters',
          style: TextStyle(
            fontFamily: 'GameFont',
            color: FantasyColors.gold,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                FantasyColors.forestGreen,
                FantasyColors.darkPurple,
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/icons/character.svg',
              width: 80,
              height: 80,
              colorFilter: const ColorFilter.mode(
                FantasyColors.gold,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Character Management',
              style: TextStyle(
                fontSize: 20,
                color: FantasyColors.cream,
                fontFamily: 'GameFont',
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Coming Soon',
              style: TextStyle(
                fontSize: 14,
                color: FantasyColors.cream,
                fontFamily: 'GameFont',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CampaignScreen extends StatelessWidget {
  const CampaignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Campaign',
          style: TextStyle(
            fontFamily: 'GameFont',
            color: FantasyColors.gold,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                FantasyColors.deepRed,
                FantasyColors.darkPurple,
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/icons/campaign.svg',
              width: 80,
              height: 80,
              colorFilter: const ColorFilter.mode(
                FantasyColors.gold,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Campaign Management',
              style: TextStyle(
                fontSize: 20,
                color: FantasyColors.cream,
                fontFamily: 'GameFont',
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Coming Soon',
              style: TextStyle(
                fontSize: 14,
                color: FantasyColors.cream,
                fontFamily: 'GameFont',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontFamily: 'GameFont',
            color: FantasyColors.gold,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                FantasyColors.arcaneBlue,
                FantasyColors.darkPurple,
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/icons/settings.svg',
              width: 80,
              height: 80,
              colorFilter: const ColorFilter.mode(
                FantasyColors.gold,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Settings',
              style: TextStyle(
                fontSize: 20,
                color: FantasyColors.cream,
                fontFamily: 'GameFont',
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Coming Soon',
              style: TextStyle(
                fontSize: 14,
                color: FantasyColors.cream,
                fontFamily: 'GameFont',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SvgBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const SvgBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            FantasyColors.darkPurple,
            FantasyColors.deepPurple,
          ],
        ),
        border: Border(
          top: BorderSide(
            color: FantasyColors.gold.withOpacity(0.3),
            width: 1,
          ),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        selectedItemColor: FantasyColors.gold,
        unselectedItemColor: FantasyColors.cream.withOpacity(0.5),
        selectedLabelStyle: const TextStyle(
          fontFamily: 'GameFont',
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'GameFont',
          fontSize: 11,
        ),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/icons/dice.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                currentIndex == 0 ? FantasyColors.gold : FantasyColors.cream.withOpacity(0.5),
                BlendMode.srcIn,
              ),
            ),
            label: 'Dice',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/icons/character.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                currentIndex == 1 ? FantasyColors.gold : FantasyColors.cream.withOpacity(0.5),
                BlendMode.srcIn,
              ),
            ),
            label: 'Characters',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/icons/campaign.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                currentIndex == 2 ? FantasyColors.gold : FantasyColors.cream.withOpacity(0.5),
                BlendMode.srcIn,
              ),
            ),
            label: 'Campaign',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/icons/settings.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                currentIndex == 3 ? FantasyColors.gold : FantasyColors.cream.withOpacity(0.5),
                BlendMode.srcIn,
              ),
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
