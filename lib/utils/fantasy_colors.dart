import 'package:flutter/material.dart';

/// Colori a tema fantasy per l'interfaccia dell'applicazione TTRPG
class FantasyColors {
  const FantasyColors._();

  // Colori principali
  static const Color deepPurple = Color(0xFF2E1A47);
  static const Color darkPurple = Color(0xFF1F0D3A);
  static const Color royalPurple = Color(0xFF4B2C8A);
  
  static const Color forestGreen = Color(0xFF1B4D3E);
  static const Color emeraldGreen = Color(0xFF2D6E5A);
  static const Color mossGreen = Color(0xFF3A5F4D);
  
  static const Color deepRed = Color(0xFF6B1E1E);
  static const Color crimson = Color(0xFF8B2635);
  static const Color burgundy = Color(0xFF5C1A2E);
  
  // Colori di accento
  static const Color gold = Color(0xFFD4AF37);
  static const Color amber = Color(0xFFFFBF00);
  static const Color bronze = Color(0xFFCD7F32);
  static const Color copper = Color(0xFFB87333);
  
  // Colori neutri
  static const Color cream = Color(0xFFF5E6D3);
  static const Color parchment = Color(0xFFE8DCC4);
  static const Color darkBackground = Color(0xFF0F0F1A);
  static const Color charcoal = Color(0xFF2C2C3A);
  
  // Colori magici/arcani
  static const Color arcaneBlue = Color(0xFF1E3A8A);
  static const Color mysticalTeal = Color(0xFF0D9488);
  static const Color etherealViolet = Color(0xFF6D28D9);
  
  // Colori elementali
  static const Color fireOrange = Color(0xFFEA580C);
  static const Color iceBlue = Color(0xFF0EA5E9);
  static const Color earthBrown = Color(0xFF78350F);
  static const Color lightningYellow = Color(0xFFFACC15);
  
  // Gradienti predefiniti (da usare con LinearGradient)
  static const List<Color> nightSkyGradient = [
    deepPurple,
    darkPurple,
    Color(0xFF0F0F1A),
  ];
  
  static const List<Color> forestGradient = [
    forestGreen,
    mossGreen,
    darkBackground,
  ];
  
  static const List<Color> treasureGradient = [
    gold,
    amber,
    bronze,
  ];
  
  static const List<Color> magicGradient = [
    arcaneBlue,
    mysticalTeal,
    etherealViolet,
  ];
  
  // Helper per ottenere colori con opacità
  static Color withOpacity(Color color, double opacity) {
    return color.withOpacity(opacity);
  }
  
  // Colore per testo su sfondi scuri
  static const Color textOnDark = cream;
  
  // Colore per testo su sfondi chiari
  static const Color textOnLight = charcoal;
  
  // Colori per stati
  static const Color success = emeraldGreen;
  static const Color warning = amber;
  static const Color error = deepRed;
  static const Color info = arcaneBlue;
}
