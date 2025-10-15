# flutter_starter_project

> This Flutter starter project is designed to serve as a **base template** for Flutter apps

## 📁 Structure Folder

```bash
📂 flutter_starter_project/
├── 📂 android/                   # Android native project folder
├── 📂 ios/                       # iOS native project folder
├── 📂 lib/                       # Main Flutter source code
│   ├── 📂 common/                # Constants, enums, extensions, themes
│   ├── 📂 helper/                # Utility/helper functions
│   ├── 📄 main.dart              # Flutter app entry point
│   ├── 📂 models/                # Data model / entity classes
│   ├── 📂 providers/             # State management (Riverpod providers)
│   ├── 📂 repositories/          # API calls & data repository
│   ├── 📂 routes/                # Routing & navigation setup (GoRouter)
│   ├── 📂 screens/               # UI screens (Login, Dashboard, etc.)
│   └── 📂 widgets/               # Reusable widgets
├── 📂 test/                      # Unit & widget tests
├── 📂 web/                       # Folder for Flutter Web build (optional)
├── 📄 .env                       # Environment variables (API keys, base URLs)
├── 📄 .metadata                  # Flutter project metadata
├── 📄 analysis_options.yaml      # Linter & code style rules
├── 📄 flutter_starter_project.iml # IDE configuration file (IntelliJ/Android Studio)
├── 📄 package.json               # Node/npm configuration (if any frontend tools)
├── 📄 pubspec.lock               # Locked dependencies file
├── 📄 pubspec.yaml               # Project dependencies & configuration
└── 📄 README.md                  # Project documentation

```

### System Requirements

- **Flutter SDK**: >= 3.25.5
- **Dart SDK**: >= 3.8.1 (included in Flutter)
- **IDE**: Android Studio / VS Code + Flutter & Dart extensions
- **Device**: Android Emulator / iOS Simulator / Physical Device / Chrome

### Verify Installation

Run the following command to check the environment:

```bash
flutter doctor
```

Expected output:

```
[✓] Flutter (Channel stable, 3.32.5+)
[✓] Android toolchain - develop for Android devices
[✓] Windows Version
[✓] Xcode - develop for iOS and macOS (Mac only)
[✓] Chrome - develop for the web
[✓] Android Studio
[✓] VS Code
[✓] Connected device (1 available)
[✓] Network resources
```

**Note:** The Android Studio and VS Code versions do not have to be exactly the same, the important thing is that there is a checkmark [✓]

### Fix Common Issues

**❌ Android licenses not accepted**

```bash
flutter doctor --android-licenses
```

## Installation & Setup

### Clone repository

```bash
git clone https://github.com/username/flutter_starter_project.git
cd flutter_starter_project
```

### Install dependencies

```bash
flutter pub get
```

### Run the app:

```bash
flutter run
```

### Build release APK:

```bash
flutter build apk --release
```

## 📦 Dependencies

### Core Dependencies

## 📦 Dependencies

### Core Dependencies

- **flutter_riverpod** (^3.0.3) - State management
- **riverpod_annotation** (^3.0.3) - Code generation untuk providers
- **go_router** (^16.2.4) - Declarative routing & deep linking
- **dio** (^5.9.0) - HTTP client dengan interceptors

### Code Generation

- **build_runner** (^2.7.1) - Code generation runner
- **riverpod_generator** (^3.0.3) - Generator untuk Riverpod providers
