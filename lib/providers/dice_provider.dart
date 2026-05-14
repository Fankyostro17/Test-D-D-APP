import 'dart:math';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/dice_result.dart';

class DiceProvider extends ChangeNotifier {
  final Random _random = Random();
  final Uuid _uuid = const Uuid();
  
  List<DiceResult> _rollHistory = [];
  bool _isRolling = false;

  List<DiceResult> get rollHistory => _rollHistory;
  bool get isRolling => _isRolling;

  Future<DiceResult> rollDice(int diceType, {String? id}) async {
    _isRolling = true;
    notifyListeners();

    // Simulate rolling animation time
    await Future.delayed(const Duration(milliseconds: 500));

    final result = _random.nextInt(diceType) + 1;
    final diceResult = DiceResult(
      id: id ?? _uuid.v4(),
      diceType: diceType,
      result: result,
      timestamp: DateTime.now(),
      isCriticalSuccess: result == diceType,
      isCriticalFailure: result == 1,
    );

    _rollHistory.insert(0, diceResult);
    _isRolling = false;
    notifyListeners();

    return diceResult;
  }

  Future<List<DiceResult>> rollMultipleDice(int diceType, int count) async {
    final results = <DiceResult>[];
    for (int i = 0; i < count; i++) {
      final result = await rollDice(diceType);
      results.add(result);
    }
    return results;
  }

  Future<Map<String, dynamic>> rollDnDCheck({
    int abilityModifier = 0,
    int proficiencyBonus = 0,
    bool isProficient = false,
  }) async {
    final diceResult = await rollDice(20);
    final total = diceResult.result + abilityModifier + (isProficient ? proficiencyBonus : 0);
    
    return {
      'diceResult': diceResult,
      'modifier': abilityModifier,
      'proficiencyBonus': isProficient ? proficiencyBonus : 0,
      'total': total,
    };
  }

  void clearHistory() {
    _rollHistory.clear();
    notifyListeners();
  }

  String getDiceSvgPath(int diceType) {
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
