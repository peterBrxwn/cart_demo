# Cart Demo App
This is the source code for the demo app Cart Demo mobile app (ios and android) built using flutter programming language.

#### App Screenshots

<table>
  <tr>
    <td align="center">Categories Page</td>
    <td>&nbsp;&nbsp;&nbsp;</td>
    <td align="center">Product Page</td>
    <td>&nbsp;&nbsp;&nbsp;</td>
    <td align="center">Checkout Page</td>
  </tr>
  <tr>
    <td><img src="/assets/screenshots/1.png" width=270></td>
    <td>&nbsp;</td>
    <td><img src="/assets/screenshots/2.png" width=270></td>
    <td>&nbsp;</td>
    <td><img src="/assets/screenshots/3.png" width=270></td>
  </tr>
</table>

## Requirements
-  Flutter version 3.3.0
-  Flutter sdk environment: ">=2.16.1 <3.0.0"

## Getting Started
For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Run `flutter pub get` to download dependencies.
Build the application by running `flutter run --flavor dev -t lib/main_dev.dart`.

or run and debug sidebar, select dev (from the top dropdown), click run (icon).

## Testing

### Integration tests
To run integration tests: `flutter run integration_test/init_test.dart`

### Upgrade pubspec
```bash
flutter pub upgrade --major-versions
```

### Run on device
Open run and debug sidebar, select dev (from the top dropdown), click run (icon).

### Build APK
```bash
flutter build apk;
```

### Build IPA
```bash
flutter build ipa;
```

## Production Deployment Sequence
-  update version (pubspec & app store connect)
-  remove print statements
-  remove assert
-  clear todo
-  clear console problems
-  (ios only) running -> general -> version and build
```bash
  flutter clean
```
```bash
  flutter pub get
```
```bash
  flutter pub run import_sorter:main
```
```bash
  flutter build appbundle;
```
```bash
  flutter build ipa
```

### Staging
Changes are deployed to the staging environment after a PR is merged into the `dev` branch

### Production
Changes are deployed to the production environment after a release is created, click [here](https://github.com/peterbrown0/cart_demo/releases/new) to create a release, see [releases section](#releases)

## Releases

### Naming Convention
Use the application version and build number.
vAppVersion+AppBuildNumber

- AppVersion (gotten from pubspec file) - 1.0.8

- AppBuildNumber (gotten from pubspec file) - 6

Example:

Release: v1.0.8+6

-  Increase major version after a major rewrite. (1 in above example)
-  Increase minor version after adding a feature. (0 in above example)
-  Increase bug version for bug fixes. (9 in above example)
-  Increase build number for every production release. (7 in above example)
