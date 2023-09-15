import 'package:flutter/material.dart';
import 'package:toolbox/src/features/iranian_plates/presentation/widgets/army_plate_widget.dart';
import 'package:toolbox/src/features/iranian_plates/presentation/widgets/general_plate_widget.dart';
import 'package:toolbox/src/features/iranian_plates/presentation/widgets/government_plate_widget.dart';
import 'package:toolbox/src/features/iranian_plates/presentation/widgets/military_plate_widget.dart';
import 'package:toolbox/src/features/iranian_plates/presentation/widgets/motor_government_plate_widget.dart';
import 'package:toolbox/src/features/iranian_plates/presentation/widgets/motor_plate_widget.dart';
import 'package:toolbox/src/features/iranian_plates/presentation/widgets/personal_plate_widget.dart';
import 'package:toolbox/src/features/iranian_plates/presentation/widgets/police_plate_widget.dart';
import 'package:toolbox/src/features/iranian_plates/presentation/widgets/political_plate_widget.dart';
import 'package:toolbox/src/features/iranian_plates/presentation/widgets/protocol_plate_widget.dart';
import 'package:toolbox/src/features/iranian_plates/presentation/widgets/temporary_plate_widget.dart';
import 'package:toolbox/src/features/iranian_plates/presentation/widgets/transit_plate_widget.dart';
import 'package:toolbox/src/features/iranian_plates/presentation/widgets/vetrans_plate_widget.dart';

/// ## [PlateKeys] Class documentations :
///
/// A utility class for managing and providing global keys for various plate types.
/// Global keys can be used to access and control the state of specific widgets.
///
/// ### Usage:
/// To access the state of a widget associated with a particular plate type, use
/// the corresponding global key from this class.
///
/// ### Example:
/// ```dart
/// PlatesKeys().generalPlateKey.currentState?.someMethod();
/// ```
class PlateKeys {
  /// Global key for the [PersonalPlate] widget.
  GlobalKey<PersonalPlateState> personalPlateKey =
      GlobalKey<PersonalPlateState>(debugLabel: '_personalPlateKey');

  /// Global key for the [GeneralPlate] widget.
  GlobalKey<GeneralPlateState> generalPlateKey =
      GlobalKey<GeneralPlateState>(debugLabel: '_generalPlateKey');

  /// Global key for the [ArmyPlate] widget.
  GlobalKey<ArmyPlateState> armyPlateKey =
      GlobalKey<ArmyPlateState>(debugLabel: '_armyPlateKey');

  /// Global key for the [GovernmentPlate] widget.
  GlobalKey<GovernmentPlateState> governmentPlateKey =
      GlobalKey<GovernmentPlateState>(debugLabel: '_governmentPlateKey');

  /// Global key for the [MilitaryPlate] widget.
  GlobalKey<MilitaryPlateState> militaryPlateKey =
      GlobalKey<MilitaryPlateState>(debugLabel: '_militaryPlateKey');

  /// Global key for the [MilitaryPlate] widget.
  GlobalKey<MilitaryPlateState> defencePlateKey =
      GlobalKey<MilitaryPlateState>(debugLabel: '_defencePlateKey');

  /// Global key for the [MotorGovernmentPlate] widget.
  GlobalKey<MotorGovernmentPlateState> motorGovernmentPlateKey =
      GlobalKey<MotorGovernmentPlateState>(
          debugLabel: '_motorGovernmentPlateKey');

  /// Global key for the [MotorPlate] widget.
  GlobalKey<MotorPlateState> motorPlateKey =
      GlobalKey<MotorPlateState>(debugLabel: '_motorPlateKey');

  /// Global key for the [PolicePlate] widget.
  GlobalKey<PolicePlateState> policePlateKey =
      GlobalKey<PolicePlateState>(debugLabel: '_policePlateKey');

  /// Global key for the [PolicePlate] widget.
  GlobalKey<PolicePlateState> sepahPlateKey =
      GlobalKey<PolicePlateState>(debugLabel: '_sepahPlateKey');

  /// Global key for the [PoliticalPlate] widget.
  GlobalKey<PoliticalPlateState> politicalPlateKey =
      GlobalKey<PoliticalPlateState>(debugLabel: '_politicalPlateKey');

  /// Global key for the [PoliticalPlate] widget.
  GlobalKey<PoliticalPlateState> diplomatPlateKey =
      GlobalKey<PoliticalPlateState>(debugLabel: '_diplomatPlateKey');

  /// Global key for the [ProtocolPlate] widget.
  GlobalKey<ProtocolPlateState> protocolPlateKey =
      GlobalKey<ProtocolPlateState>(debugLabel: '_protocolPlateKey');

  /// Global key for the [TransitPlate] widget.
  GlobalKey<TransitPlateState> transitPlateKey =
      GlobalKey<TransitPlateState>(debugLabel: '_transitPlateKey');

  /// Global key for the [VetransPlate] widget.
  GlobalKey<VetransPlateState> vetransPlateKey =
      GlobalKey<VetransPlateState>(debugLabel: '_vetransPlateKey');

  /// Global key for the [TemporaryPlate] widget.
  GlobalKey<TemporaryPlateState> temporaryPlateKey =
      GlobalKey<TemporaryPlateState>(debugLabel: '_temporaryPlateKey');
}
