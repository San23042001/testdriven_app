# testdriven_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Command to generate keystore.jks.base64
- Windows command [Convert]::ToBase64String([IO.File]::ReadAllBytes("keystore.jks")) > keystore.jks.base64
- Linux or MacOS command base64 -w 0 keystore.jks > keystore.jks.base64

