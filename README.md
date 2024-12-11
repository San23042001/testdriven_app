# Flutter TDD and CI/CD with GitHub Actions

## 🚀 Project Overview

This project showcases **Test-Driven Development (TDD)** in Flutter and implements a **CI/CD pipeline** using GitHub Actions to automate the build, test, and release process. The project is designed to demonstrate industry best practices in Flutter development, ensuring quality and consistency across all stages of development.

---

## 📂 Project Structure

The project follows a **Clean Architecture** and includes:

- **`lib/`**: Contains the core application code, following domain-driven design principles.
- **`test/`**: Unit and widget tests for TDD.
- **`.github/`**: Configurations for the GitHub Actions CI/CD pipeline.

---

## ⚙️ Features

- **Test-Driven Development (TDD)**:
  - Comprehensive unit, widget, and integration tests.
  - Mocking dependencies using libraries like `mockito` or `mocktail`.

- **CI/CD Pipeline**:
  - Automated testing, build, and deployment using GitHub Actions.
  - Cross-platform workflows for Android, iOS, and web builds.

---

## 🛠️ Technologies Used

- **Flutter**: For app development.
- **GitHub Actions**: For CI/CD pipeline automation.
- **Mockito/Mocktail**: For testing and mocking.
- **Fastlane**: For automating app store submissions (optional).
- **Firebase App Distribution**: For beta testing (optional).

---

## 🧪 Test-Driven Development Workflow

1. **Write Tests**: Define tests for the feature you want to build (unit, widget, or integration).
2. **Run Tests**: Ensure tests fail (red).
3. **Write Code**: Implement the feature to pass the tests (green).
4. **Refactor**: Optimize the code without changing functionality.


Run tests using:
```bash
flutter test
```

### Key Steps

1. **Setup Flutter**: Installs Flutter stable version.
2. **Install Dependencies**: Runs `flutter pub get` to fetch dependencies.
3. **Run Tests**: Executes unit and widget tests.
4. **Build APK**: Creates a release APK.
5. **Upload Artifact**: Uploads the APK as a build artifact.
6. **Release to Firebase**: Deploys the build to Firebase App Distribution (optional).

---


## Command to generate keystore.jks.base64
- Windows command [Convert]::ToBase64String([IO.File]::ReadAllBytes("keystore.jks")) > keystore.jks.base64
- Linux or MacOS command base64 -w 0 keystore.jks > keystore.jks.base64

