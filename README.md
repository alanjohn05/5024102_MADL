Mobile Application Development (MAD) Lab — Flutter
This repository contains the 10 MAD Lab experiments and the Flora – Flower Shop Management App developed using Flutter and Dart. It brings together practical examples of Flutter UI development, forms, layouts, navigation, JSON handling, database connectivity, testing and Android deployment, along with a larger application project.
Contents
- Technologies
- Getting Started
- MAD Lab Experiments
- Flora — Flower Shop Management App
- Security Notes
- Repository Structure
Technologies
- Flutter and Dart for cross-platform application development
- Material Design widgets for user interfaces
- Supabase for the student database practical (Experiment 9)
- Firebase Authentication and Cloud Firestore for the Flora application
- fl_chart for chart visualisations
- Android SDK / Flutter CLI for analysis, testing and Android builds
Getting Started
Install the Flutter SDK and Android SDK, and configure an Android emulator or connect a physical device. Verify your environment with:
flutter doctor
flutter devices
For an individual experiment supplied as a standalone main.dart, create a Flutter project and copy the file into its lib/main.dart:
flutter create mad_lab_demo
cd mad_lab_demo
# Copy the selected experiment's main.dart into lib/main.dart
flutter pub get
flutter run
Run one experiment at a time. Some experiments require extra packages or service configuration; the relevant notes are listed below and in the experiment folders.
MAD Lab Experiments
Experiment 1 — Flutter Environment Setup
Aim: Install and configure Flutter, Android Studio, Android SDK and an emulator, then verify the development environment.

Useful commands:
flutter doctor
flutter doctor --android-licenses
flutter devices
This is a setup practical; the main outcome is a working Flutter toolchain rather than a separate app.

Detailed instructions: [`experiment-01-flutter-setup/README.md`](experiment-01-flutter-setup/README.md)
Experiment 2 — Hello World App
Aim: Build a basic interactive Flutter app using MaterialApp, Scaffold, StatefulWidget, Text and ElevatedButton.

Tapping Say Hello updates the greeting using setState().

Source: [`experiment-02-hello-world/main.dart`](experiment-02-hello-world/main.dart)
Experiment 3 — Common Flutter Widgets
Aim: Create a student-registration interface using text, containers, rows, columns, images, text fields, icons and buttons.

Source: [`experiment-03-flutter-widgets/main.dart`](experiment-03-flutter-widgets/main.dart)
Experiment 4 — Form Validation
Aim: Build a form that validates user input before submission using Form, GlobalKey<FormState> and TextFormField validators.

Source: [`experiment-04-form-validation/main.dart`](experiment-04-form-validation/main.dart)
Experiment 5 — Layout Widgets and Dashboard
Aim: Practise layout composition using Row, Column, Container, Expanded, Padding, Card and GridView to create a dashboard.

Source: [`experiment-05-layout-widgets/main.dart`](experiment-05-layout-widgets/main.dart)
Experiment 6 — Icons, Images and Charts
Aim: Combine Material icons, network images, statistic cards and a bar chart in a dashboard interface.

Dependency: fl_chart.
flutter pub add fl_chart
Source: [`experiment-06-icons-images-charts/main.dart`](experiment-06-icons-images-charts/main.dart)
Experiment 7 — Navigation, Routes and Gestures
Aim: Implement screen navigation and respond to gestures such as taps, long presses and double taps. The sample dashboard links to Courses, Profile and Settings screens.

Source: [`experiment-07-navigation-gestures/main.dart`](experiment-07-navigation-gestures/main.dart)
Experiment 8 — JSON and File Operations
Aim: Demonstrate JSON encoding, reading and deleting data using jsonEncode and jsonDecode.

Note: This example stores the JSON string in memory to demonstrate the workflow. It does not persist the data to device storage, and the data is lost when the app restarts.

Source: [`experiment-08-json-file-operations/main.dart`](experiment-08-json-file-operations/main.dart)
Experiment 9 — Supabase Student Database
Aim: Connect a Flutter interface to Supabase and demonstrate create, read and delete operations on student records.

To run the practical:
1. Create a Supabase project and a students table with the required columns, such as id, name and course.
2. Add the http package.
3. Configure the Supabase project URL and publishable/anon key in the experiment code as described in its README.
4. Configure Row Level Security (RLS) policies for the required operations.
5. Run the app and test saving, reading and deleting records.
Source and setup: [`experiment-09-supabase-database/`](experiment-09-supabase-database/)
Experiment 10 — Testing and Android Deployment
Aim: Analyse a Flutter project, test it on devices, build Android release artifacts and review the signing process.
flutter devices
flutter run
flutter analyze
flutter build apk --release
flutter build appbundle
APK and App Bundle files are normally generated under build/app/outputs/. Release signing must be configured securely before distributing an app.

Detailed instructions: [`experiment-10-testing-deployment/README.md`](experiment-10-testing-deployment/README.md)
Flora — Flower Shop Management App
Flora is a Flutter-based flower shop management application. It brings day-to-day shop operations together, including billing, stock management, customer records, dues and reporting. The app uses Firebase Authentication and Cloud Firestore; the running Flutter app does not use Supabase.
Main Features
- Dashboard: Overview of shop activity and key information.
- Billing / POS: Create receipts, record payments, deduct stock through Firestore transactions and void bills.
- Sales ledger: Review recorded sales and related transaction information.
- Inventory: Manage products and bouquet recipes, with separate stock receipt, waste, adjustment and stock-history records.
- Customers: Maintain customer information.
- Credits and dues: Track outstanding and overdue amounts.
- Reports and charts: Review revenue, profit, units sold and product charts for a selected date range. Voided bills are excluded from reports.
- Planning insights: View weekly sales changes, reorder proposals, bouquet ideas, days of stock remaining and seven-day demand ranges with a prior-week comparison. These are calculations based on shop data; proposals require manual action and do not automatically change stock or prices.
- Receipts: Generate and share/print billing receipts where supported by the device.
Run Flora Locally
1. Install Flutter and the Android SDK.
2. Open a terminal in the Flora project directory (the directory containing pubspec.yaml).
3. Fetch dependencies and run the application:
flutter pub get
flutter run
To build an Android APK:
flutter build apk --release
Firebase Configuration
The supplied project is configured for Firebase project flora-411ad. The Android app uses the package identifier com.sidhiflorals.sidhi_florals; Firebase app options are in lib/firebase_options.dart. Google sign-in and Firestore access depend on the Firebase Authentication configuration and the rules in firestore.rules.

The supplied Firestore rules currently restrict access to a specific verified Google account. If the authorised account or project owner changes, update the rules appropriately and redeploy them. A new Android release-signing key may also need its SHA-1 and SHA-256 fingerprints registered in the Firebase Android app.

To redeploy the supplied Firestore rules and Authentication configuration, from the project directory:
npx -y firebase-tools@latest deploy --only firestore:rules,auth --project flora-411ad
Web Google sign-in requires the deployed web domain to be listed among the authorised domains in Firebase Authentication settings.
Security Notes
- Never commit Firebase private credentials, signing keystores, passwords, or other secrets to a public repository.
- Do not put a Supabase service_role key in a client-side Flutter app. Use a publishable/anon key with appropriately configured RLS policies for Experiment 9.
- Review Firestore rules and authorised accounts before sharing or deploying Flora. Do not expose real customer or student data in public screenshots or test databases.
- The supplied Flora README indicates that its current release build uses the standard debug signing key. Configure a production signing key before distributing a production release.
Repository Structure
The exact top-level structure depends on how the project files are arranged in GitHub. A suggested organisation is:
.
├── README.md
├── experiment-01-flutter-setup/
├── experiment-02-hello-world/
├── experiment-03-flutter-widgets/
├── experiment-04-form-validation/
├── experiment-05-layout-widgets/
├── experiment-06-icons-images-charts/
├── experiment-07-navigation-gestures/
├── experiment-08-json-file-operations/
├── experiment-09-supabase-database/
├── experiment-10-testing-deployment/
└── flora-flutter-main/        # Flora Flutter project (if kept in a subfolder)
