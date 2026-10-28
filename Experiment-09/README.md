Experiment 9: Student Database Using Supabase
Aim
To build a Flutter student database interface and demonstrate storing student records in a Supabase database.
Description
The app interface is titled Student Database and contains fields for:
- Student ID
- Student Name
- Course
It provides SAVE, READ, and DELETE buttons. The screenshots show sample student details entered in the app and the corresponding students table in the Supabase Table Editor.
Screenshots
1. Student Database Form — Sneha
The form shows Student ID 102, Student Name sneha, and Course mech, with the status message Student saved successfully!
![Experiment 9 Output](screenshots/experiment-09(dbform-sneha).png)

2. Student Database Form — Kabir
The form shows Student ID 201, Student Name kabir, and Course comps, with the status message Student saved successfully!
![Experiment 9 Output](screenshots/experiment-09(dbform-kabir).png)

3. Supabase Students Table — After the Additional Record
The table shows the additional record with ID 201, name kabir, and course comps, alongside the existing records.
![Experiment 9 Output](screenshots/experiment-09(supabasetable).png)

Features Demonstrated
- Student data entry using form fields
- Save, Read, and Delete controls
- Student records with ID, name, and course
- Supabase Table Editor for viewing database records
- Status feedback after saving a student
How to Run
1. Ensure Flutter is installed and configured.
2. Configure the project with the required Supabase URL and anon key, following the project's existing setup.
3. Open the Flutter project directory in a terminal.
4. Connect an Android device or start an emulator.
5. Run:
   flutter pub get
   flutter run
Expected Result
The app displays a Student Database form for entering a student ID, name, and course. Student records saved through the app can be viewed in the Supabase students table, as illustrated in the screenshots.
Conclusion
This experiment demonstrates a Flutter student database interface connected to Supabase, with form-based record operations and verification of stored records in the database table.
