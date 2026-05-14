import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../models/dice_result.dart';

class DiceResultDisplay extends StatelessWidget {
  final DiceResult result;

  const DiceResultDisplay({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    Color resultColor;
    String resultText;

    if (result.isCriticalSuccess) {
      resultColor = Colors.green;
      resultText = 'Critical Success!';
    } else if (result.isCriticalFailure) {
      resultColor = Colors.red;
      resultText = 'Critical Failure!';
    } else {
      resultColor = Colors.white;
      resultText = '';
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: resultColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: resultColor, width: 2),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: resultColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                '${result.result}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'd${result.diceType}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (resultText.isNotEmpty)
                  Text(
                    resultText,
                    style: TextStyle(
                      fontSize: 14,
                      color: resultColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                Text(
                  _formatTime(result.timestamp),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
          SvgPicture.asset(
            _getDiceSvgPath(result.diceType),
            width: 40,
            height: 40,
            colorFilter: ColorFilter.mode(
              resultColor,
              BlendMode.srcIn,
            ),
            placeholderBuilder: (_) => Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: resultColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    final second = time.second.toString().padLeft(2, '0');
    return '$hour:$minute:$second';
  }

  String _getDiceSvgPath(int diceType) {
    switch (diceType) {
      case 4:
        return 'assets/svg/dice/d4.svg';
      case 6:
        return 'assets/svg/dice/d6.svg';
      case 8:
        return 'assets/svg/dice/d8.svg';
      case 10:
        return 'assets/svg/dice/d10.svg';
      case 12:
        return 'assets/svg/dice/d12.svg';
      case 20:
        return 'assets/svg/dice/d20.svg';
      default:
        return 'assets/svg/dice/d6.svg';
    }
  }
}
