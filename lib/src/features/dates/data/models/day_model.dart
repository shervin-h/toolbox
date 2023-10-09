/// ## [DayModel] documentation :
///
/// The `DayModel` class represents a model for a day in a calendar or date picker. It provides information about the day's ID, name, date, and whether it is currently selected or not.
///
/// ### Properties:
///
/// - `id` (required): An integer representing the unique identifier for the day.
/// - `name` (required): A string representing the name or label of the day (e.g., "Monday," "Tuesday").
/// - `date` (required): A string representing the date associated with the day (e.g., "2023-09-01").
/// - `isSelected` (required): A boolean indicating whether the day is currently selected or not.
///
/// ### Constructors:
///
/// - The class has a single constructor that requires all properties to be provided during object creation.
///
/// ### Example:
///
/// ```dart
/// // Creating instances of DayModel
/// DayModel monday = DayModel(id: 1, name: "Monday", date: "2023-09-04", isSelected: false);
/// DayModel friday = DayModel(id: 5, name: "Friday", date: "2023-09-08", isSelected: true);
///
/// // Accessing properties of DayModel
/// print("Day Name: ${monday.name}");
/// print("Date: ${friday.date}");
/// print("Is Selected: ${friday.isSelected}");
/// ```
///
/// ### Use Case:
///
/// The `DayModel` class is commonly used in scenarios where you need to represent and manage a list of days, such as in calendar components, date pickers, or event scheduling.
class DayModel {
  final int id;
  final String name;
  final String date;
  final bool isSelected;

  DayModel({
    required this.id,
    required this.name,
    required this.date,
    required this.isSelected,
  });
}
