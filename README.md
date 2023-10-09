<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

# Toolbox

A library that includes tools needed by Flutter developers

## Install Package

Add the following line to your `pubspec.yaml` under `dependencies`:

```yaml
dependencies:
  toolbox: ^0.0.1
```

Then run:

```
flutter pub get
```

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

```dart
import 'package:toolbox/toolbox.dart';
```

```dart
const MapWidget(
  latitude: 35.785843522589396,
  longitude: 51.317320018994764,
  height: 200,
  margin: EdgeInsets.all(20),
),
```

```dart
MapLocationWidget(
  margin: const EdgeInsets.all(20),
  latitude: 35.785843522589396,
  longitude: 51.317320018994764,
  onLocationChanged: (latLng) {
  debugPrint(
    'Latitude: ${latLng.latitude}, Longitude: ${latLng.longitude}');
  },
),
```

```dart
ArmyPlate(width: 400, enable: true,),
```

```dart
GeneralPlate(width: 500, enable: true,),
```

```dart
RetryWidget(
  onPressed: () {} ,
  message: 'message',
  label: 'label',
),
```

```dart
DatesWidget(
days: [
    DayModel(
      id: 1,
      name: 'دوشنبه',
      date: '12',
      isSelected: false,
    ),
    DayModel(
      id: 2,
      name: 'سه شنبه',
      date: '13',
      isSelected: true,
    ),
    DayModel(
      id: 3,
      name: 'چهار شنبه',
      date: '14',
      isSelected: false,
    ),
    DayModel(
      id: 4,
      name: 'پنج شنبه',
      date: '15',
      isSelected: false,
    ),
    DayModel(
      id: 5,
      name: 'جمعه',
      date: '16',
      isSelected: false,
    ),
  ],
  selectedItemColor: Colors.orange,
  unSelectedItemColor: Colors.white,
),
```

```dart
Text(
  getDifferenceInDays(
  start: '2023-08-01',
  end: '2023-09-01',
  ),
),
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
