# Sleepy timer

## Running the project

#### Install Flutter: [Install | Flutter](https://docs.flutter.dev/get-started/install)

#### Get project dependencies:
```bash
flutter pub get
```
#### Create the platforms directories you need:
```bash
flutter create --platforms=windows,macos,linux,android,ios,web .
```
The example above creates all the possible platforms directories, if you want to create only a android directory, you should use:
```bash
flutter create --platforms=android .
```
#### Create the build directory:
```bash
flutter build windows
```
#### Release the Windows app: [Building Windows apps with Flutter](https://docs.flutter.dev/platform-integration/windows/building)