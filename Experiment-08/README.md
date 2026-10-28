Experiment 8: File Manager — JSON File Operations
Aim
To demonstrate Save, Read, and Delete operations for JSON data through a Flutter File Manager interface.
Description
The app is titled File Manager and displays a My File panel with three buttons:
- Save
- Read
- Delete
The initial screen shows No file created yet. The saved-data screenshot displays a JSON object containing the name, course, and save status. The read screenshot displays Status: Saved successfully.

The interface also includes the note: Demo note: this stores JSON in memory, not on the device disk. Therefore, the screenshots demonstrate an in-memory JSON operation rather than confirming persistent storage on the device.
Screenshots
1. Initial Screen
The app starts with no file created yet and provides Save, Read, and Delete buttons.
![Experiment 8 Output](screenshots/experiment-08(initial).png)

2. After Saving JSON Data
The screen displays the saved JSON data:
{"name":"Alan","course":"Mobile Application Development Lab","status":"Saved successfully"}
![Experiment 8 Output](screenshots/experiment-08(save).png)

4. After Reading
The screen displays Status: Saved successfully after the Read action.
![Experiment 8 Output](screenshots/experiment-08(read).png)

Features Demonstrated
- Saving JSON data in memory
- Reading and displaying saved status
- Delete button in the interface
- Displaying file state and operation results
- Flutter UI elements such as icons, buttons, text, and containers
How to Run
1. Ensure Flutter is installed and configured.
2. Open the Flutter project directory in a terminal.
3. Connect an Android device or start an emulator.
4. Run:
   flutter pub get
   flutter run
Expected Result
The app displays the File Manager interface. Save and Read actions show the data/status illustrated in the screenshots. The on-screen note specifies that the demo stores JSON in memory, not on the device disk.
Conclusion
This experiment demonstrates a simple Flutter interface for illustrating JSON Save and Read operations, with a Delete control and visible status feedback.
