# Trabc

An Android client for [Traccar](https://www.traccar.org/) GPS tracking, built with
Flutter and OpenStreetMap. No Google services, no proprietary libraries, no ads,
no trackers.

## Features

- Live tracking on OpenStreetMap-based maps (MapLibre / `flutter_map`)
- Device list with status, last position and recent history
- Route history playback with speed and stop information
- Geofences: draw, edit and manage circles and polygons
- Reports: trips, stops, summary, events, positions, chart and combined reports
- Notifications and notification settings
- Share devices, send commands, manage drivers, groups and maintenance
- Offline address lookup with an online (Nominatim) fallback
- Light/dark themes, translated into many languages

## Requirements

- Flutter 3.44.x (stable) with the matching Dart SDK
- Android SDK with the platform/NDK versions requested by Flutter

## Build

```sh
flutter pub get
flutter build apk --release
```

The APK is written to `build/app/outputs/flutter-apk/app-release.apk`.

The offline reverse-geocoding databases used by earlier builds are **not** bundled
in this repository. They were dropped so the repository stays small and fully
buildable from source. Offline address lookup therefore falls back to the online
Nominatim service. The generator that produced those databases is kept at
`scripts/geocoder_generator.py` for reference.

## F-Droid

This repository is laid out so that it can be built directly by the F-Droid
build server:

- `applicationId`: `com.github.onethings.trabc`
- Fastlane metadata (icon, descriptions, changelogs) lives in
  `fastlane/metadata/android/`
- No prebuilt binaries or machine-specific files are tracked
- Licensed under GPL-3.0-or-later (see `LICENSE`)

To submit to F-Droid, add a build recipe to the
[fdroiddata](https://gitlab.com/fdroid/fdroiddata) repository pointing at this
repository, for example:

```yaml
Builds:
  - versionName: 1.0.33
    versionCode: 29
    commit: <tag-or-commit>
    output: build/app/outputs/flutter-apk/app-release.apk
    srclibs:
      - flutter@stable
    prebuild: sed -i -e '/signingConfig/d' -e '/TODO/d' android/app/build.gradle.kts
    build:
      - $$flutter$$/bin/flutter config --no-analytics
      - $$flutter$$/bin/flutter build apk --release
```

## License

GPL-3.0-or-later. See [LICENSE](LICENSE).
