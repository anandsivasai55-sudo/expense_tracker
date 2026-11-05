<div align="center">💰 MY EXPENSE TRACKER

Smart Expense Management Application

A Flutter-based mobile application designed to track daily expenses, manage spending, and monitor financial activities.

"Flutter" (https://img.shields.io/badge/Flutter-Framework-02569B?logo=flutter&logoColor=white)
"Dart" (https://img.shields.io/badge/Dart-Language-0175C2?logo=dart&logoColor=white)
"Android" (https://img.shields.io/badge/Platform-Android-3DDC84?logo=android&logoColor=white)
"Version" (https://img.shields.io/badge/Version-1.0.0-orange)

</div>---

📌 About The Project

My Expense Tracker is a personal finance management application developed using Flutter.

It allows users to record daily expenses, organize transactions, monitor monthly budgets, and view category-wise spending summaries.

The application uses local device storage to maintain expense records.

✨ Features

- Add and manage daily expenses.
- View all transactions.
- View individual expense details.
- Delete unwanted expenses.
- Category-wise expense summaries.
- Monthly budget management.
- Local data storage.
- Input validation.

📱 Application Screenshots

<div align="center">Dashboard

<img src="screenshots/dashboard.png" width="280"/>Add Expense

<img src="screenshots/add_expense.png" width="280"/>Expense Summary

<img src="screenshots/summary.png" width="280"/></div>🏗️ System Architecture

flowchart TD
    A["My Expense Tracker"] --> B["Flutter UI"]
    B --> C["Provider"]
    C --> D["Screens"]
    D --> E["Expense Model"]
    C --> F["Storage Service"]
    F --> G["SharedPreferences"]

🔄 Application Workflow

flowchart TD
    A([Start]) --> B[Dashboard]
    B --> C{Select Option}
    C --> D[Add Expense]
    C --> E[View Transactions]
    C --> F[View Summary]
    D --> G[Validate Details]
    G --> H[Save Expense]
    H --> I[Update Dashboard]
    E --> I
    F --> I
    I --> B

🛠️ Technology Stack

Technology| Usage
Flutter| Mobile UI development
Dart| Programming language
Provider| State management
SharedPreferences| Local storage
Android| Application platform
GitHub| Version control

💾 Data Management

- Expense records are stored locally.
- SharedPreferences is used for persistence.
- No external database is required.
- No backend server is used.

⚙️ Installation

1. Clone the repository

git clone YOUR_REPOSITORY_URL

2. Open the project folder

cd expense_tracker

3. Install dependencies

flutter pub get

4. Run the application

flutter run

👥 Team Members

S.No| Name| Roll Number| Responsibility
1| Anand Siva Sai Munaga| 248X1A4597| Development & Integration
2| Kavati Manoj Kumar| 248X1A4571| UI Design & Expense Screens
3| M. John Babu| 248X1A4598| Testing & Documentation

👨‍💻 Project Developer

Anand Siva Sai Munaga

Flutter Development | UI Design | Expense Management | Testing

🚀 Future Enhancements

- Interactive expense charts.
- Monthly and yearly reports.
- Budget notifications.
- PDF report generation.
- Cloud backup.

---

<div align="center">💙 MY EXPENSE TRACKER

Track Smart. Spend Better.

Developed with Flutter

</div>
