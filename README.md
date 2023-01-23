
# Freebank

## Status
- In progress

## Description
- WIP

## Visuals
- WIP

## Features
- WIP

## Getting Started
Copy the .env.example file and rename it to .env

Get the dependencies

```
flutter pub get
```
Generate code files

```
flutter pub run build_runner build --delete-conflicting-outputs
```

You can run it directly from your preferred editor (VSCode or Android Studio) or you can run it in the terminal using
```
flutter run
```
## Environments
- You can add new environment variables to the .env file
- When you add new variables to the .env file, please remember to create a getter for it in the app_environment_config.dart file

## Architecture & Folder Structure
This app uses a combination of the architecture guidelines in a [guide to app architecture](https://developer.android.com/topic/architecture) and a feature-first project approach to structuring the project.

```
├── app
├── core
├── example
└── main.dart
```

### App
This folder contains the features that the app supports. Each feature should normally have at least 3 layers:

```
├── ui
├── domain (optional)
├── data
└── di
```

An optional layer called the domain layer can sit between the UI layer and the data layer to simplify and reuse the interactions between them.

#### The UI layer:
```
├── view (screens & widgets)
├── view_model (state manager)
```

This is responsible for producing and displaying ui state to the user
- The view layer houses the screens and widgets
- The view_model layer processes ui events and exposes immutable state to the view. This app uses Riverpod for state management

#### The Data layer:

```
├── repository
├── data_source
├── model
```
The data layer drives the features in the app. It is responsible for handling data operations and exposing data to the layers above it
- The repository layer centralizes changes to the data and exposes data to the rest of the app.

- The datasource layer
- The model layer

### Core
This folder contains shared resources that are used across the app

## Dependency Injection & State Management:
- This app uses Riverpod for dependency injection and state management. See the [package](https://pub.dev/packages/flutter_riverpod) and [docs](https://docs-v2.riverpod.dev/) for more info

## Routing/Navigation:
- This app uses GoRouter for routing/navigation. See the [docs](https://pub.dev/packages/go_router) for more info

## Working with Translations
- WIP

## Testing & CI/CD
- WIP

