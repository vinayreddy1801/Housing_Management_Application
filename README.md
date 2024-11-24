# **Housing Management Application**

## **Overview**
The **Housing Management Application** is a mobile application developed to manage on-campus housing at the University of North Texas. This app provides role-based access for students, staff, and administrators, streamlining tasks like room management, maintenance tracking, and billing. The app ensures better organization and efficiency in housing operations.

---

## **Features**
- **Role-Based Access**:
  - Secure login functionality tailored for students, staff, and administrators.
  - Role-specific dashboards and features to ensure appropriate access.

- **Room Management**:
  - Real-time tracking of room availability, assignments, and reservations.
  - User-friendly workflows for check-ins and check-outs.

- **Maintenance Requests**:
  - Students can submit maintenance requests through the app.
  - Staff members can update the status of requests and notify students.

- **Billing and Payments**:
  - Automatic generation of housing bills for students.
  - Payment tracking with reminders for due payments.

---

## **Technologies Used**
- **Frontend**: Flutter (Dart)
- **State Management**: Provider
- **Backend**: REST APIs (if applicable)
- **Database**: Firebase / SQL
- **Tools**: Visual Studio Code, Postman (for API testing)

---

## **Project Structure**
```plaintext
Housing_Management_Application/
├── lib/                   # Core application code
│   ├── main.dart          # Entry point of the application
│   ├── screens/           # Subfolder containing UI screens (e.g., LoginScreen, HomeScreen)
│   ├── api_services/      # Subfolder for API service logic
│   ├── models/            # Data models (if applicable)
│   └── other folders...   # Additional components (if any)
├── assets/                # Static assets such as images and fonts
├── pubspec.yaml           # Defines dependencies and metadata for the project
├── pubspec.lock           # Locks dependency versions for consistency
├── README.md              # Documentation of the project
