import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../providers/dice_provider.dart';
import '../widgets/svg_dice_button.dart';
import '../widgets/dice_result_display.dart';

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
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SvgBottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
        ),
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
            const AppBar(
              title: Text('Dice Roller'),
              centerTitle: true,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Select a die to roll',
                      style: TextStyle(fontSize: 18),
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
                      const Divider(),
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
    return const Scaffold(
      appBar: AppBar(
        title: Text('Characters'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Character List - Coming Soon'),
      ),
    );
  }
}

class CampaignScreen extends StatelessWidget {
  const CampaignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBar(
        title: Text('Campaign'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Campaign Management - Coming Soon'),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Settings - Coming Soon'),
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
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF8B4513),
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svg/icons/dice.svg',
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              currentIndex == 0 ? const Color(0xFF8B4513) : Colors.grey,
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
              currentIndex == 1 ? const Color(0xFF8B4513) : Colors.grey,
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
              currentIndex == 2 ? const Color(0xFF8B4513) : Colors.grey,
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
              currentIndex == 3 ? const Color(0xFF8B4513) : Colors.grey,
              BlendMode.srcIn,
            ),
          ),
          label: 'Settings',
        ),
      ],
    );
  }
}
