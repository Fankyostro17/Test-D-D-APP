import 'package:flutter/material.dart';
import '../models/character.dart';

class CharacterProvider extends ChangeNotifier {
  List<Character> _characters = [];
  Character? _activeCharacter;

  List<Character> get characters => _characters;
  Character? get activeCharacter => _activeCharacter;

  void addCharacter(Character character) {
    _characters.add(character);
    if (_activeCharacter == null) {
      _activeCharacter = character;
    }
    notifyListeners();
  }

  void updateCharacter(Character character) {
    final index = _characters.indexWhere((c) => c.id == character.id);
    if (index != -1) {
      _characters[index] = character;
      if (_activeCharacter?.id == character.id) {
        _activeCharacter = character;
      }
      notifyListeners();
    }
  }

  void deleteCharacter(String id) {
    _characters.removeWhere((c) => c.id == id);
    if (_activeCharacter?.id == id) {
      _activeCharacter = _characters.isNotEmpty ? _characters.first : null;
    }
    notifyListeners();
  }

  void setActiveCharacter(String id) {
    _activeCharacter = _characters.firstWhere(
      (c) => c.id == id,
      orElse: () => throw Exception('Character not found'),
    );
    notifyListeners();
  }

  void updateHitPoints(int current, int max) {
    if (_activeCharacter != null) {
      _activeCharacter = _activeCharacter!.copyWith(
        hitPoints: current,
        maxHitPoints: max,
      );
      updateCharacter(_activeCharacter!);
    }
  }

  void rollHitPointDamage(int damage) {
    if (_activeCharacter != null) {
      final newHp = (_activeCharacter!.hitPoints - damage).clamp(0, _activeCharacter!.maxHitPoints);
      updateHitPoints(newHp, _activeCharacter!.maxHitPoints);
    }
  }

  void healHitPoints(int healing) {
    if (_activeCharacter != null) {
      final newHp = (_activeCharacter!.hitPoints + healing).clamp(0, _activeCharacter!.maxHitPoints);
      updateHitPoints(newHp, _activeCharacter!.maxHitPoints);
    }
  }
}
