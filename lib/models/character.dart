import 'package:flutter/material.dart';

class Character {
  final String id;
  final String name;
  final String gameSystem;
  final String characterClass;
  final int level;
  final int hitPoints;
  final int maxHitPoints;
  final int armorClass;
  final Map<String, int> abilities;
  final List<String> skills;
  final List<String> inventory;
  final String? avatarSvgPath;

  Character({
    required this.id,
    required this.name,
    this.gameSystem = 'D&D 5e',
    this.characterClass = 'Fighter',
    this.level = 1,
    this.hitPoints = 10,
    this.maxHitPoints = 10,
    this.armorClass = 10,
    required this.abilities,
    this.skills = const [],
    this.inventory = const [],
    this.avatarSvgPath,
  });

  Character copyWith({
    String? id,
    String? name,
    String? gameSystem,
    String? characterClass,
    int? level,
    int? hitPoints,
    int? maxHitPoints,
    int? armorClass,
    Map<String, int>? abilities,
    List<String>? skills,
    List<String>? inventory,
    String? avatarSvgPath,
  }) {
    return Character(
      id: id ?? this.id,
      name: name ?? this.name,
      gameSystem: gameSystem ?? this.gameSystem,
      characterClass: characterClass ?? this.characterClass,
      level: level ?? this.level,
      hitPoints: hitPoints ?? this.hitPoints,
      maxHitPoints: maxHitPoints ?? this.maxHitPoints,
      armorClass: armorClass ?? this.armorClass,
      abilities: abilities ?? this.abilities,
      skills: skills ?? this.skills,
      inventory: inventory ?? this.inventory,
      avatarSvgPath: avatarSvgPath ?? this.avatarSvgPath,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'gameSystem': gameSystem,
      'characterClass': characterClass,
      'level': level,
      'hitPoints': hitPoints,
      'maxHitPoints': maxHitPoints,
      'armorClass': armorClass,
      'abilities': abilities,
      'skills': skills,
      'inventory': inventory,
      'avatarSvgPath': avatarSvgPath,
    };
  }

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      gameSystem: json['gameSystem'] ?? 'D&D 5e',
      characterClass: json['characterClass'] ?? 'Fighter',
      level: json['level'] ?? 1,
      hitPoints: json['hitPoints'] ?? 10,
      maxHitPoints: json['maxHitPoints'] ?? 10,
      armorClass: json['armorClass'] ?? 10,
      abilities: Map<String, int>.from(json['abilities'] ?? {}),
      skills: List<String>.from(json['skills'] ?? []),
      inventory: List<String>.from(json['inventory'] ?? []),
      avatarSvgPath: json['avatarSvgPath'],
    );
  }
}
