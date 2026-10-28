MOBILE APPLICATION DEVELOPMENT (MAD) LAB — FLUTTER

OVERVIEW

This repository brings together ten Mobile Application Development lab experiments and Flora, a Flower Shop Management App. The practicals demonstrate fundamental Flutter and Dart concepts, including interface design, widgets, form validation, layouts, navigation, JSON handling, database connectivity, testing, and Android deployment. Flora applies mobile development concepts to everyday flower shop operations.

TECHNOLOGIES USED

Flutter and Dart are used to build the mobile applications and user interfaces. Material Design widgets provide common interface components. The experiments cover navigation, form handling, data processing, and database communication. Supabase is used in Experiment 9 for the student database practical. Flora uses Firebase Authentication and Cloud Firestore for authentication and shop data. Additional packages support charts, navigation, and receipt generation. The Android SDK and Flutter development tools are used to analyse, test, and build the applications.

GETTING STARTED

Install and configure the Flutter SDK and Android SDK. Set up an Android emulator or connect a compatible Android device. Check that the development environment is configured correctly before running an experiment.

Run one experiment at a time. Some experiments may require additional packages, database setup, or service configuration. Complete the relevant setup before testing the application.

MAD LAB EXPERIMENTS

EXPERIMENT 1 — FLUTTER ENVIRONMENT SETUP

Aim: To install and configure Flutter, Android Studio, the Android SDK, and an emulator, and verify that the development environment is ready for use.

Description: This practical introduces the tools required for Flutter development. The main outcome is a working development environment that can recognise connected devices and run Flutter applications.

EXPERIMENT 2 — HELLO WORLD APPLICATION

Aim: To create a basic interactive Flutter application.

Description: This practical introduces the structure of a Flutter application and the use of common interface elements, including the application scaffold, text, and buttons. When the user taps the greeting button, the displayed message changes. This demonstrates how application state can be updated in response to user interaction.

EXPERIMENT 3 — COMMON FLUTTER WIDGETS

Aim: To create a student registration interface using common Flutter widgets.

Description: This practical demonstrates how text, containers, rows, columns, images, text fields, icons, and buttons can be combined to build a user interface. It introduces the role of widgets in arranging content and collecting information from users.

EXPERIMENT 4 — FORM VALIDATION

Aim: To validate user input before accepting a form submission.

Description: This practical demonstrates form fields and validation rules. The application checks the entered information and allows submission only when the required validation conditions are satisfied. It highlights the importance of preventing incomplete or invalid input.

EXPERIMENT 5 — LAYOUT WIDGETS AND DASHBOARD

Aim: To practise arranging interface elements using Flutter layout widgets.

Description: This practical uses rows, columns, containers, expanded areas, padding, cards, and grid layouts to organise content. The result is a dashboard-style interface that demonstrates spacing, alignment, grouping, and responsive layout composition.

EXPERIMENT 6 — ICONS, IMAGES, AND CHARTS

Aim: To build a dashboard that combines icons, images, statistics, and a chart.

Description: This practical demonstrates the use of Material icons, images, statistic cards, and a bar chart. It shows how visual elements can make information easier to scan and understand. Chart functionality requires the relevant chart package to be configured in the project.

EXPERIMENT 7 — NAVIGATION, ROUTES, AND GESTURES

Aim: To implement movement between application screens and respond to user gestures.

Description: This practical demonstrates navigation between screens such as Courses, Profile, and Settings. It also introduces gestures such as taps, long presses, and double taps. The experiment shows how an application can organise related screens and respond to different user actions.

EXPERIMENT 8 — JSON AND DATA OPERATIONS

Aim: To demonstrate JSON encoding, decoding, and basic data operations.

Description: This practical introduces converting data to JSON format and reading it back into application data. The demonstrated example stores the JSON string in memory rather than permanently saving it to device storage. As a result, the stored example data is lost when the application restarts.

EXPERIMENT 9 — SUPABASE STUDENT DATABASE

Aim: To connect a Flutter application to a Supabase database and demonstrate creating, reading, and deleting student records.

Description: This practical introduces communication between a mobile interface and a hosted database service. The application can save student details, retrieve existing records, and delete selected records. A Supabase project and student table must be configured, and suitable Row Level Security policies must be applied before the operations are tested. Database credentials should be configured carefully and must not expose privileged service keys in the client application.

EXPERIMENT 10 — TESTING AND ANDROID DEPLOYMENT

Aim: To analyse a Flutter application, test it on a device, and prepare Android release builds.

Description: This practical covers checking the development environment, running the application, analysing the project for issues, and building Android release artifacts. It also introduces the release-signing process. Production applications should use properly managed release-signing credentials before distribution.

FLORA — FLOWER SHOP MANAGEMENT APP

PROJECT OVERVIEW

Flora is a Flutter-based flower shop management application designed to bring essential shop operations together in one place. It supports billing, stock management, customer records, outstanding dues, and business reports. The application uses Firebase Authentication and Cloud Firestore for authentication and data storage.

MAIN FEATURES

Dashboard: Provides an overview of shop activity and key information.

Billing and Point of Sale: Supports bill creation, receipt generation, payment recording, stock deduction, and bill cancellation where supported by the application logic.

Sales Ledger: Allows staff to review recorded sales and related transaction details.

Inventory Management: Supports product management and bouquet recipes, along with records for stock received, waste, adjustments, and stock history.

Customer Management: Maintains customer information and supports reviewing customer-related records.

Credits and Dues: Helps track unpaid and outstanding balances and record payments against dues.

Reports and Charts: Presents business information such as revenue, profit, units sold, and product performance for a selected date range. Voided bills are excluded from reports.

Planning Insights: Provides data-based views such as weekly sales changes, reorder proposals, bouquet suggestions, estimated days of stock remaining, and seven-day demand ranges compared with the previous week. These insights are recommendations and calculations; they do not automatically change stock quantities or prices.

Receipts: Supports generating and sharing or printing receipts on compatible devices.

RUNNING FLORA

Install and configure Flutter and the Android SDK. Open the Flora project in the Flutter development environment, retrieve its required dependencies, and run it on an emulator or connected Android device. An Android release package can be built after the project has been configured and tested.

FIREBASE CONFIGURATION AND ACCESS

The supplied project is configured for a Firebase project named flora-411ad. The Android application uses the package identifier com.sidhiflorals.sidhi_florals, and its Firebase app options are stored in the project configuration. Google sign-in and Firestore access depend on the Firebase Authentication settings and the deployed Firestore security rules.

The supplied Firestore rules restrict access to a specific verified Google account. If the authorised account or project owner changes, the access rules must be reviewed and updated appropriately. A release-signing key may also require its SHA-1 and SHA-256 fingerprints to be registered with the Firebase Android application. Google sign-in on the web requires the deployed domain to be included in Firebase Authentication's authorised domains.

SECURITY NOTES

Do not commit private credentials, passwords, signing keystores, or other secrets to a public repository.

For the Supabase practical, do not place a privileged service-role key in a client-side Flutter application. Use an appropriate publishable or anonymous key together with correctly configured Row Level Security policies.

Review Firebase authentication settings, Firestore security rules, and authorised accounts before sharing or deploying Flora. Do not use real customer or student information in public demonstrations or test data.

Before distributing a production release, configure and verify an appropriate production signing key. Do not assume that a development or debug signing key is suitable for production distribution.

CONCLUSION

The ten MAD Lab experiments provide practical exposure to Flutter development, from environment setup and basic widgets to forms, layouts, navigation, JSON operations, database connectivity, testing, and deployment. Flora demonstrates how these concepts can be combined in a more complete application for managing flower shop activities, including billing, inventory, customers, dues, receipts, and reporting.
