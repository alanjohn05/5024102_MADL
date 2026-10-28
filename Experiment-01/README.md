# Experiment 1 — Install and configure Flutter

**Aim:** Install and configure Flutter, Android Studio, Android SDK and an Android emulator.

## Procedure
1. Install Flutter SDK and add its `bin` directory to PATH.
2. Install Android Studio and the Android SDK/platform tools.
3. Install the Flutter and Dart plugins in Android Studio.
4. Create an Android Virtual Device (AVD), or connect an Android phone with USB debugging enabled.
5. Open a terminal and run:

```bash
flutter --version
dart --version
flutter doctor
flutter doctor --android-licenses
flutter devices
```

6. Resolve any issues reported by `flutter doctor`, then run it again.

## Expected result
Flutter and Dart are detected, Android toolchain licenses are accepted, and at least one emulator or device is listed. Exact `flutter doctor` output varies by machine and installed versions.
