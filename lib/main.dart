import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/welcome_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'providers/character_provider.dart';
import 'providers/dice_provider.dart';
import 'providers/game_provider.dart';
import 'utils/fantasy_colors.dart';

void main() {
  runApp(const TTRPGCompanionApp());
}

class TTRPGCompanionApp extends StatelessWidget {
  const TTRPGCompanionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CharacterProvider()),
        ChangeNotifierProvider(create: (_) => DiceProvider()),
        ChangeNotifierProvider(create: (_) => GameProvider()),
      ],
      child: MaterialApp(
        title: 'TTRPG Companion',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: FantasyColors.gold,
            brightness: Brightness.dark,
          ),
          scaffoldBackgroundColor: FantasyColors.darkBackground,
          appBarTheme: const AppBarTheme(
            backgroundColor: FantasyColors.darkPurple,
            foregroundColor: FantasyColors.cream,
            elevation: 0,
          ),
          useMaterial3: true,
          fontFamily: 'GameFont',
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const WelcomeScreen(),
          '/splash': (context) => const SplashScreen(),
          '/home': (context) => const HomeScreen(),
        },
      ),
    );
  }
}
