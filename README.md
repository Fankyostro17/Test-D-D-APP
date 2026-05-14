# TTRPG Companion App

A cross-platform Flutter application for playing Dungeons & Dragons and other tabletop RPGs, featuring a complete SVG-based user interface.

## Features

### Core Functionality
- **Dice Roller**: Roll all standard polyhedral dice (d4, d6, d8, d10, d12, d20)
  - Animated rolling effects
  - Roll history with timestamps
  - Critical success/failure detection
  - Support for multiple dice rolls

- **Character Management**
  - Create and manage multiple characters
  - Support for different game systems (D&D 5e, Pathfinder 2e, custom)
  - Track hit points, armor class, and ability scores
  - Character sheet with skills and inventory

- **Campaign Tools**
  - Party management
  - Combat tracker
  - Initiative ordering
  - Round counter

- **SVG-Based UI**
  - All icons and graphics are SVG-based for crisp rendering on all devices
  - Customizable themes
  - Responsive design for mobile, tablet, and desktop

### Supported Game Systems
- Dungeons & Dragons 5th Edition (default)
- Pathfinder 2nd Edition
- Custom/Other systems (extensible)

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/                   # Data models
│   ├── character.dart        # Character model
│   └── dice_result.dart      # Dice roll result model
├── providers/                # State management
│   ├── character_provider.dart
│   ├── dice_provider.dart
│   └── game_provider.dart
├── screens/                  # App screens
│   └── home_screen.dart
├── widgets/                  # Reusable UI components
│   ├── svg_dice_button.dart
│   └── dice_result_display.dart
└── utils/                    # Utility functions

assets/
├── svg/
│   ├── dice/                 # Dice SVG files
│   ├── icons/                # Navigation and UI icons
│   └── backgrounds/          # Background patterns
└── fonts/                    # Custom fonts
```

## Getting Started

### Prerequisites
- Flutter SDK 3.5.0 or higher
- Dart SDK 3.5.0 or higher

### Installation

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

### Building for Different Platforms

**Android:**
```bash
flutter build apk
```

**iOS:**
```bash
flutter build ios
```

**Web:**
```bash
flutter build web
```

**Desktop (Windows/macOS/Linux):**
```bash
flutter build windows
flutter build macos
flutter build linux
```

## Dependencies

- `flutter_svg`: SVG rendering
- `provider`: State management
- `shared_preferences`: Local storage
- `hive`: NoSQL database
- `uuid`: Unique ID generation
- `intl`: Internationalization

## Customization

### Adding New Game Systems

Edit `lib/providers/game_provider.dart` and add your custom system to the `getGameSystemData()` method:

```dart
case 'YourCustomSystem':
  return {
    'name': 'Your Custom RPG',
    'abilities': ['STAT1', 'STAT2', 'STAT3'],
    'skills': ['Skill1', 'Skill2'],
    'diceTypes': [6, 10, 20],
  };
```

### Adding Custom SVG Assets

Place your SVG files in the appropriate directory under `assets/svg/` and reference them in your code:

```dart
SvgPicture.asset('assets/svg/icons/your_icon.svg')
```

## Roadmap

- [ ] Character sheet editor
- [ ] Spell tracking
- [ ] Equipment management
- [ ] Campaign notes
- [ ] Multiplayer support
- [ ] Cloud sync
- [ ] Character import/export
- [ ] Virtual tabletop integration

## License

This project is open source and available under the MIT License.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
