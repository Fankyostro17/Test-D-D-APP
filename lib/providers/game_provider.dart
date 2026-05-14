import 'package:flutter/material.dart';
import '../models/character.dart';

class GameProvider extends ChangeNotifier {
  String _gameSystem = 'D&D 5e';
  List<Character> _partyMembers = [];
  bool _isInCombat = false;
  int _currentRound = 0;
  Character? _dmCharacter;

  String get gameSystem => _gameSystem;
  List<Character> get partyMembers => _partyMembers;
  bool get isInCombat => _isInCombat;
  int get currentRound => _currentRound;
  Character? get dmCharacter => _dmCharacter;

  void setGameSystem(String system) {
    _gameSystem = system;
    notifyListeners();
  }

  void addPartyMember(Character character) {
    if (!_partyMembers.any((c) => c.id == character.id)) {
      _partyMembers.add(character);
      notifyListeners();
    }
  }

  void removePartyMember(String id) {
    _partyMembers.removeWhere((c) => c.id == id);
    notifyListeners();
  }

  void startCombat() {
    _isInCombat = true;
    _currentRound = 1;
    notifyListeners();
  }

  void endCombat() {
    _isInCombat = false;
    _currentRound = 0;
    notifyListeners();
  }

  void nextRound() {
    if (_isInCombat) {
      _currentRound++;
      notifyListeners();
    }
  }

  void setDmCharacter(Character? character) {
    _dmCharacter = character;
    notifyListeners();
  }

  Map<String, dynamic> getGameSystemData() {
    switch (_gameSystem) {
      case 'D&D 5e':
        return {
          'name': 'Dungeons & Dragons 5th Edition',
          'abilities': ['STR', 'DEX', 'CON', 'INT', 'WIS', 'CHA'],
          'skills': [
            'Acrobatics', 'Animal Handling', 'Arcana', 'Athletics',
            'Deception', 'History', 'Insight', 'Intimidation',
            'Investigation', 'Medicine', 'Nature', 'Perception',
            'Performance', 'Persuasion', 'Religion', 'Sleight of Hand',
            'Stealth', 'Survival'
          ],
          'diceTypes': [4, 6, 8, 10, 12, 20],
        };
      case 'Pathfinder 2e':
        return {
          'name': 'Pathfinder 2nd Edition',
          'abilities': ['STR', 'DEX', 'CON', 'INT', 'WIS', 'CHA'],
          'skills': [
            'Acrobatics', 'Arcana', 'Athletics', 'Crafting',
            'Deception', 'Diplomacy', 'Intimidation', 'Medicine',
            'Nature', 'Occultism', 'Perception', 'Performance',
            'Religion', 'Society', 'Stealth', 'Survival', 'Thievery'
          ],
          'diceTypes': [4, 6, 8, 10, 12, 20],
        };
      default:
        return {
          'name': _gameSystem,
          'abilities': [],
          'skills': [],
          'diceTypes': [6, 10, 20],
        };
    }
  }
}
