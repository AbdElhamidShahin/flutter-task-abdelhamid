# Flutter Task Abdelhamid

A Flutter application built to demonstrate clean architecture, organized structure, and modern state management practices.

---

##  Tech Stack & Architecture

This project follows **MVVM architecture** and **clean code principles** to ensure clarity, scalability, and easy maintenance.

---

###  Architecture & Design

- **MVVM (Model–View–ViewModel):** Provides a clear separation between UI and business logic.
- **Feature-based structure:** Each feature is isolated in its own folder for better project organization.
- **Clean Code practices:** Consistent naming, clear responsibilities, and reusable components.

---

###  State Management

- **BLoC (Cubit):** Used to manage application state in a predictable and testable way.

---

###  Dependency Injection

- **GetIt & Injectable:** Simplifies dependency management and keeps components loosely coupled.

---

###  Navigation

- **GoRouter:** Handles app navigation and supports deep linking.

---

###  Networking

- **Dio:** A powerful HTTP client for handling APIs, error management, and interceptors.

---

###  Code Generation & Data Modeling

- **Freezed:** Generates immutable data classes with minimal boilerplate.
- **Json Serializable:** Simplifies converting JSON data to and from Dart objects.

---

###  UI & Responsiveness

- **Flutter ScreenUtil:** Helps create responsive layouts that look great on all screen sizes.

---

##  Getting Started

To run the project locally:

```bash
flutter pub get
flutter run
