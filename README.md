# Astanovka (Final Project)

Flutter app for rating city places.

## Setup

### 1) Install dependencies
- `flutter pub get`

### 2) Firebase (you must do this part)
This repo now contains the app-side code for Firebase Auth (login/register/sign-out), but **Firebase project setup cannot be done automatically here** because it requires your Firebase console + generated platform config files.

Do these steps on your machine/account:
1. Create a Firebase project in Firebase Console.
2. Enable **Authentication → Sign-in method → Email/Password**.
3. Install FlutterFire CLI (once): `dart pub global activate flutterfire_cli`
4. From the project root run: `flutterfire configure`
   - This generates `lib/firebase_options.dart`
   - And downloads/updates platform files like `android/app/google-services.json` and `ios/Runner/GoogleService-Info.plist`
5. Initialize Firebase in `lib/main.dart`:
   - Add `WidgetsFlutterBinding.ensureInitialized();`
   - Call `await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);`
6. Then run the app: `flutter run`

If you skip step 5, login/register will compile but will fail at runtime because Firebase is not initialized.

### 3) Drift (SQLite)
Favorites are stored locally in SQLite using Drift.
- DB file: created automatically as `app.sqlite` in the app documents directory.
- If you edit `lib/core/local/app_database.dart`, regenerate code with:
  - `dart run build_runner build`

## Implemented TODOs (Auth/Profile)
- Login/Register form UI + validation: `lib/features/profile/presentation/login_screen.dart`
- Riverpod AuthController + auth state stream: `lib/features/profile/presentation/controllers/auth_controller.dart`, `lib/features/profile/data/auth_repository.dart`
- Profile UI reacts to auth state + shows favorites from Drift: `lib/features/profile/presentation/profile_screen.dart`
- Drift database + favorites table: `lib/core/local/app_database.dart`, `lib/core/providers/database_providers.dart`
