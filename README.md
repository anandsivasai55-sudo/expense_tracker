<div align="center">💰 My Expense Tracker

Flutter-Based Personal Expense Tracking Application

A simple and efficient mobile application to manage daily expenses, monitor spending habits, and understand personal financial activities.

<br/>"Flutter" (https://img.shields.io/badge/Framework-Flutter-blue?logo=flutter)
"Dart" (https://img.shields.io/badge/Language-Dart-blue?logo=dart)
"Platform" (https://img.shields.io/badge/Platform-Android-green?logo=android)
"Version" (https://img.shields.io/badge/Version-1.0.0-orange)
"Status" (https://img.shields.io/badge/Status-Completed-success)

</div>---

📌 About The Project

Expense Tracker is a Flutter-based mobile application developed to help users record, manage, and monitor their daily expenses.

Users can add expenses with an amount, category, date, and note. The application provides transaction management and category-wise expense summaries through a simple and user-friendly interface.

The application stores expense information locally on the device using SharedPreferences without requiring an external database or backend server.

✨ Key Features

- ➕ Add Expenses – Record daily expenses with relevant details.
- 📋 View Transactions – Access all recorded transactions.
- 🔍 Expense Details – View individual expense information.
- 🗑️ Delete Expenses – Remove unwanted transactions.
- 📊 Category-wise Summary – Understand spending across categories.
- 💾 Local Storage – Save expense information on the device.
- ✅ Input Validation – Validate user-entered information.

📱 Application Screenshots

Dashboard

"Dashboard" (screenshots/dashboard.png)

Add Expense

"Add Expense" (screenshots/add_expense.png)

Expense Summary

"Summary" (screenshots/summary.png)

🏗️ Application Architecture

flowchart TD
    A[Expense Tracker App] --> B[Flutter UI]
    B --> C[Provider State Management]
    C --> D[Application Screens]
    D --> E[Expense Model]
    C --> F[Storage Service]
    F --> G[SharedPreferences]
    G --> H[Local Device Storage]

🔄 Application Workflow

flowchart TD
    A([Start Application]) --> B[Open Dashboard]
    B --> C{Select Action}
    C -->|Add Expense| D[Enter Expense Details]
    D --> E[Validate Input]
    E -->|Valid| F[Save Expense]
    E -->|Invalid| D
    F --> G[Update Dashboard]
    C -->|View Transactions| H[Display Transactions]
    C -->|View Summary| I[Display Category Summary]
    C -->|Delete Expense| J[Remove Transaction]
    J --> G
    H --> B
    I --> B
    G --> B

🛠️ Technologies Used

Technology| Purpose
Flutter| Mobile application development
Dart| Programming language
Provider| State management
SharedPreferences| Local data storage
Android| Target platform
Git & GitHub| Version control and project hosting

💾 Data Storage

The application uses SharedPreferences to store expense details locally on the user's device.

- No external database is required.
- No backend server is used.
- Expense information is managed locally.
- Data is accessed through the application's storage service.

📂 Project Structure

expense_tracker/
│
├── lib/
│   ├── models/
│   │   └── expense.dart
│   │
│   ├── providers/
│   │   └── expense_provider.dart
│   │
│   ├── services/
│   │   └── storage_service.dart
│   │
│   ├── screens/
│   │
│   ├── widgets/
│   │
│   └── main.dart
│
├── screenshots/
│   ├── dashboard.png
│   ├── add_expense.png
│   └── summary.png
│
├── pubspec.yaml
└── README.md

⚙️ Installation & Setup

Follow these steps to run the project locally.

1. Clone the repository

git clone YOUR_GITHUB_REPOSITORY_URL

2. Navigate to the project folder

cd expense_tracker

3. Install dependencies

flutter pub get

4. Run the application

flutter run

Requirements:

- Flutter SDK
- Dart SDK
- Android Studio or VS Code
- Android Emulator or Android Device

👨‍💻 Developer Contribution

Name: Anand Siva Sai Munaga

Contribution:

- Flutter application development
- User interface design
- Expense management functionality
- Local storage integration
- Application testing
- Project integration

👥 Team Members

S.No| Student Name| Roll Number| Role
1| Anand Siva Sai Munaga| 248X1A4597| Project Development & Integration
2| Kavati Manoj Kumar| 248X1A4571| UI Design & Expense Screens
3| M. John Babu| 248X1A4598| Testing & Documentation

📋 Project Information

Category| Details
Project Name| Expense Tracker
Application Type| General Expense Tracker
Platform| Android
Framework| Flutter
Programming Language| Dart
Storage| SharedPreferences
Purpose| Track daily expenses and manage spending
Version| 1.0.0

🎯 Future Enhancements

- Monthly and yearly expense reports
- Expense visualization using charts
- Budget planning and alerts
- Export expense reports as PDF
- Cloud backup and synchronization

📜 License

This project is developed for academic and educational purposes.

---

<div align="center">💙 Built with Flutter

Expense Tracker – Track Smart. Spend Better.

</div>
