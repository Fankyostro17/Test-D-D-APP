import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../providers/dice_provider.dart';

class SvgDiceButton extends StatelessWidget {
  final int diceType;

  const SvgDiceButton({super.key, required this.diceType});

  @override
  Widget build(BuildContext context) {
    return Consumer<DiceProvider>(
      builder: (context, diceProvider, child) {
        return GestureDetector(
          onTap: () async {
            await diceProvider.rollDice(diceType);
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Rolled d$diceType: ${diceProvider.rollHistory.first.result}'),
                  duration: const Duration(seconds: 2),
                ),
              );
            }
          },
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  diceProvider.getDiceSvgPath(diceType),
                  width: 70,
                  height: 70,
                  placeholderBuilder: (_) => _getDefaultDicePlaceholder(),
                ),
                Center(
                  child: Text(
                    'd$diceType',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(1, 1),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _getDefaultDicePlaceholder() {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xFF8B4513),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Center(
        child: Text(
          'd$diceType',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
