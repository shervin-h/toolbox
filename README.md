![Example Image](https://github.com/shervin-h/toolbox/blob/master/assets/images/screenshot.png?raw=true)

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

## License

[MIT](https://choosealicense.com/licenses/mit/)
