## Table of Contents

- [Project Overview](#project-overview)
- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [Key Components](#key-components)
- [App Features](#app-features)

# Online Exam App

## 📱 Project Overview

The Online Exam App is designed specifically for students, providing a seamless platform for managing their examination experience. Key features of the app include:

🖐Sign Up & Login: Users can easily create accounts and log in to access their profiles and exams.

📚Explore Exams: Students can browse available exams and choose the ones they wish to take.

📊Results Tracking: Users can view their examination results and performance history.

🤖Student Profile: Each student has a dedicated profile to manage their information and track their progress.

The app aims to provide an efficient and user-friendly experience for students in managing their examinations.

---

## 🚀 Getting Started

Follow these instructions to build and run the project.

### 1. Setup Flutter

Ensure Flutter is installed on your machine. You can follow the detailed setup instructions for your platform [here](https://flutter.dev/docs/get-started/install).

### 2. Setup Project

Clone this repository:
bash
git clone [repository-link](https://github.com/MuhamedUssama/Online-Exam-App.git)

Install dependencies:

flutter pub get

Generate required files using Builder Runner:

bashlutter pub run build_runner build --delete-conflicting-outputs

(Optional) Switch to the project's git hooks:

git config core.hooksPath .githooks/

### 3. Running the App

Ensure you have a connected Android/iOS device or simulator, then run the app in debug mode:

flutter run
