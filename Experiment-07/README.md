Experiment 7: Student Dashboard — Navigation and Gestures
Aim
To create a Flutter student dashboard with navigation to different sections and demonstrate gesture interaction.
Description
The app opens on a Student Dashboard screen with the greeting Hello, Student! and the prompt Where would you like to go?

The dashboard provides three navigation options:
- My Courses
- My Profile
- Settings
Each destination screen has a matching title and icon, plus the instruction Double tap to go back. The dashboard also displays a heart icon with the instruction Long press me, demonstrating a long-press gesture.
Screenshots
1. Student Dashboard
The main screen presents the three navigation options and the heart icon for the long-press interaction.
![Experiment 7 Output](screenshots/experiment-07(dashboard).png)

2. My Courses Screen
This destination screen displays a book icon, the title My Courses, and the instruction Double tap to go back.
![Experiment 7 Output](screenshots/experiment-07(mycourses).png)

4. My Profile Screen
This destination screen displays a profile icon, the title My Profile, and the instruction Double tap to go back.
![Experiment 7 Output](screenshots/experiment-07(myprofile).png)

6. Settings Screen
This destination screen displays a settings icon, the title Settings, and the instruction Double tap to go back.
![Experiment 7 Output](screenshots/experiment-07(settings).png)

Features Demonstrated
- Dashboard with selectable navigation cards
- Navigation to separate pages: My Courses, My Profile, and Settings
- Long-press gesture on the heart icon
- Double-tap gesture instruction on destination screens
- Use of icons, text, cards, and app bars
How to Run
1. Ensure Flutter is installed and configured.
2. Open the Flutter project directory in a terminal.
3. Connect an Android device or start an emulator.
4. Run:
   flutter pub get
   flutter run
Expected Result
The app should display the Student Dashboard. Selecting a dashboard option opens its corresponding screen. The interface also presents the long-press and double-tap gesture interactions shown in the screenshots.
Conclusion
This experiment demonstrates page navigation and gesture interaction in a Flutter application through a student dashboard and its destination screens.
