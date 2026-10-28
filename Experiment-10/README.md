Experiment 10: Flutter Testing and Android Deployment
Aim
To test a Flutter application, analyze the source code, and generate
Android release builds in APK and Android App Bundle (AAB) formats. This
experiment also demonstrates the steps involved in preparing a signing
keystore for release signing.
Software and Tools Required
- Flutter SDK
- Dart SDK (included with Flutter)
- Android Studio or Visual Studio Code
- Android SDK and a configured Android emulator or Android device
- Java Development Kit (JDK), including keytool
- A Flutter project: Campus Feedback Hub
Application Overview
Campus Feedback Hub is a Flutter application that allows students to
submit feedback about campus facilities and view recent feedback. The
screenshots show the application running on an Android device,
successful static analysis, and successful release-build generation.
Procedure
1. Run the application on a device
Connect an Android device with USB debugging enabled or start an Android
emulator. Check that Flutter detects the device:
flutter devices
Run the application on the selected device. Replace the device ID below
with the ID shown by flutter devices:
flutter run -d <device-id>
The application opens and displays the Campus Feedback Hub interface.
2. Analyze the project
From the root directory of the Flutter project, run:
flutter analyze
The recorded output reports "No issues found!", indicating that
Flutter's static analysis did not detect any issues.
3. Build a release APK
Run:
flutter build apk --release
After a successful build, the APK is generated at:
build/app/outputs/flutter-apk/app-release.apk
The captured terminal output confirms that the release APK was built
successfully.
4. Build an Android App Bundle
Run:
flutter build appbundle
After a successful build, the AAB is generated at:
build/app/outputs/bundle/release/app-release.aab
The captured terminal output confirms that the app bundle was built
successfully. An AAB is commonly used for publishing an Android
application through Google Play.
5. Create a signing keystore
A release application can be signed using a keystore. The following is
an example command; choose a secure password when prompted and store the
keystore in a safe location:
keytool -genkey -v -keystore upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
The screenshot shows a keystore being created with the alias upload.

Security note: A keystore and its passwords are sensitive. Do not
commit the real keystore, passwords, or signing credentials to a public
GitHub repository. Keep them backed up securely and use placeholders in
example configuration files.

An example key.properties file is shown below. Replace the
placeholders locally; do not publish real credentials:
storePassword=YOUR_KEYSTORE_PASSWORD
keyPassword=YOUR_KEY_PASSWORD
keyAlias=upload
storeFile=C:\\path\\to\\upload-keystore.jks
Make sure key.properties and the keystore file are excluded from Git
using .gitignore. Follow the Flutter Android app-signing documentation
to configure release signing in the Gradle build files before producing
a signed release.
Screenshots
Place the provided screenshots in a folder named screenshots/ in this
experiment's directory. Use the following filenames, or update the paths
below to match the filenames in your repository.
1. Application running on an Android device
![Experiment 10 Output](screenshots/experiment-10(run1).png)

2. Application running on another Android device
![Experiment 10 Output](screenshots/experiment-10(run2).png)

3. Flutter static analysis
![Experiment 10 Output](screenshots/experiment-10(flutterstaticanalysis).png)

4. Release APK build
![Experiment 10 Output](screenshots/experiment-10(releaseapk).png)

5. Android App Bundle build
![Experiment 10 Output](screenshots/experiment-10(androidappbuild).png)

6. Keystore generation
![Experiment 10 Output](screenshots/experiment-10(keystoregeneration).png)

7. Signing configuration example
![Experiment 10 Output](screenshots/experiment-10(signconfex).png)


Important: GitHub displays images only when the image files are
committed at the referenced paths. If your screenshots have different
names, either rename them to match the names above or change the
Markdown image paths accordingly.

Result
The Campus Feedback Hub Flutter project was analyzed successfully, and
both the release APK and Android App Bundle were generated. The
keystore-generation process and an example signing configuration were
also demonstrated.
Conclusion
This experiment covered basic Flutter project validation and Android
release preparation. flutter analyze was used to check the code, while
flutter build apk --release and flutter build appbundle generated
the Android release artifacts. Signing credentials must be handled
securely and must not be exposed in a public repository.
