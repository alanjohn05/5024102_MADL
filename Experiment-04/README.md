Experiment 4: Registration Portal
Aim
To create a registration form in Flutter that accepts user details and provides Submit and Reset buttons.
Description
The Registration Portal screen includes:
- A welcome heading and the instruction Please fill in your details below.
- A New User Account banner with a user icon and supporting text.
- Input fields for Full Name, Email Address, and Phone Number.
- Submit and Reset buttons.
The second screenshot shows the form filled with sample details and a confirmation message after submission.
Screenshots
1. Initial Registration Form
The registration form is displayed with empty fields ready for the user to enter their details.
![Experiment 4 Output](screenshots/experiment-04(initial).png)

2. Form Filled and Submitted
The form contains sample details: Alan, alanjohn@gmail.com, and 9876543210. A message at the bottom confirms: Form submitted successfully!
![Experiment 4 Output](screenshots/experiment-04(registered).png)

Widgets and Features Demonstrated
- Text headings and supporting text
- Containers and a banner-style layout
- Text fields for name, email address, and phone number
- Icons
- Submit and Reset buttons
- Submission confirmation message
How to Run
1. Ensure Flutter is installed and configured.
2. Open the Flutter project directory in a terminal.
3. Connect an Android device or start an emulator.
4. Run:
   flutter pub get
   flutter run
Expected Result
The app displays a registration form with fields for a user's name, email address, and phone number. When the form is submitted, it displays a success message as shown in the second screenshot.
Conclusion
This experiment demonstrates the creation of a Flutter registration interface with multiple input fields, action buttons, and a submission confirmation message.
