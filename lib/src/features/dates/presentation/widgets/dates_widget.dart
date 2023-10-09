import 'package:flutter/material.dart';
import 'package:persian_toolbox/src/features/dates/data/models/day_model.dart';

/// ## [DatesWidget] documentation :
///
/// The `DatesWidget` class is a customizable widget for displaying a horizontal list of date items. It allows users to scroll through a list of date options and select a specific date.
///
/// ### Properties:
///
/// - `days` (required): A list of `DayModel` objects representing the date items to be displayed in the widget.
/// - `width`: An optional double value representing the width of the `DatesWidget`. If not provided, it takes the full available width.
/// - `selectedItemColor`: An optional color for the selected date item. If not provided, it defaults to the color `Colors.green`.
/// - `unSelectedItemColor`: An optional color for the unselected date items. If not provided, it defaults to the color `Colors.grey`.
/// - `onDateChange`: An optional callback function that is triggered when a date is selected or changed.
///
/// ### Constructors:
///
/// - The class has a single constructor that requires the `days` list and allows for optional `width`, `selectedItemColor`, `unSelectedItemColor`, and `onDateChange` properties.
///
/// ### Methods:
///
/// - `increase()`: A method that allows the user to scroll to the next date item in the list. It triggers the `onDateChange` callback when called.
/// - `decrease()`: A method that allows the user to scroll to the previous date item in the list. It triggers the `onDateChange` callback when called.
///
/// ### Example:
///
/// ```dart
/// // Creating a DatesWidget
/// DatesWidget(
///   days: [
///     DayModel(id: 1, name: "Mon", date: "01", isSelected: false),
///     DayModel(id: 2, name: "Tue", date: "02", isSelected: true),
///     DayModel(id: 3, name: "Wed", date: "03", isSelected: false),
///   ],
///   width: 300.0,
///   selectedItemColor: Colors.blue,
///   unSelectedItemColor: Colors.grey,
///   onDateChange: () {
///     // Handle date change logic here
///   },
/// )
///
/// // Using the increase and decrease methods
/// final datesWidget = DatesWidget(
///   days: [...],
/// );
/// datesWidget.increase(); // Scroll to the next date item
/// datesWidget.decrease(); // Scroll to the previous date item
/// ```
///
/// ### Use Case:
///
/// The `DatesWidget` class is commonly used in date selection components where users can scroll through available dates and select one. It provides a user-friendly way to interact with date options and allows customization of the date items' appearance and behavior.
class DatesWidget extends StatefulWidget {
  const DatesWidget({
    required this.days,
    this.width,
    this.selectedItemColor,
    this.unSelectedItemColor,
    this.onDateChange,
    Key? key,
  }) : super(key: key);

  final List<DayModel> days;
  final double? width;
  final Color? selectedItemColor;
  final Color? unSelectedItemColor;
  final void Function()? onDateChange;

  @override
  State<DatesWidget> createState() => DatesWidgetState();
}

class DatesWidgetState extends State<DatesWidget> {
  late ScrollController scrollController;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void increase() {
    if (currentIndex > 0) {
      scrollController
          .animateTo(
        --currentIndex * DateItemWidget.itemWidth,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeIn,
      )
          .then(
        (_) {
          rebuildState();
          widget.onDateChange?.call();
        },
      );
    }
  }

  void decrease() {
    if (currentIndex < widget.days.length - 1) {
      scrollController
          .animateTo(
        ++currentIndex * DateItemWidget.itemWidth,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeIn,
      )
          .then(
        (_) {
          rebuildState();
          widget.onDateChange?.call();
        },
      );
    }
  }

  void rebuildState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(bottom: 16),
      width: widget.width ?? double.infinity,
      height: 100,
      color: Colors.transparent,
      child: (widget.days.isNotEmpty)
          ? ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: ListView.builder(
                padding: const EdgeInsetsDirectional.only(start: 16),
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.days.length,
                itemBuilder: (context, index) {
                  final day = widget.days[index];
                  return GestureDetector(
                    onTap: () {
                      currentIndex = index;
                      scrollController
                          .animateTo(
                        currentIndex * DateItemWidget.itemWidth,
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.easeIn,
                      )
                          .then(
                        (_) {
                          rebuildState();
                          widget.onDateChange?.call();
                        },
                      );
                    },
                    child: DateItemWidget(
                      date: day.name,
                      dateNumber: day.date,
                      yourChoice: currentIndex == index,
                      desc: '',
                      selectedColor: widget.selectedItemColor ?? Colors.green,
                      unSelectedColor:
                          widget.unSelectedItemColor ?? Colors.grey,
                    ),
                  );
                },
              ),
            )
          : Center(
              child: Text(
                'Nothing to Show',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.grey.shade900,
                    ),
              ),
            ),
    );
  }
}

/// ## [DateItemWidget] documentation :
///
/// The `DateItemWidget` class is a customizable widget for displaying date items, often used in date pickers, calendars, or event scheduling components. It allows you to display a date, date number, and an optional description within a container.
///
/// ### Properties:
///
/// - `date` (required): A string representing the date to be displayed (e.g., "Mon," "Tue").
/// - `dateNumber` (required): A string representing the date number (e.g., "01," "15").
/// - `desc`: An optional string providing additional description or information about the date item.
/// - `yourChoice`: A boolean indicating whether the date item is selected or not. If selected, it will use the `selectedColor` for styling; otherwise, it will use the `unSelectedColor`.
/// - `selectedColor` (required): The color used for styling the date item when it is selected.
/// - `unSelectedColor` (required): The color used for styling the date item when it is not selected.
///
/// ### Static Properties:
///
/// - `itemWidth`: A static constant double representing the default width of the date item container (64 by default).
///
/// ### Constructors:
///
/// - The class has a single constructor that requires the `date`, `dateNumber`, `selectedColor`, and `unSelectedColor`. The `desc` and `yourChoice` properties are optional.
///
/// ### Example:
///
/// ```dart
/// // Creating a DateItemWidget
/// DateItemWidget(
///   date: "Mon",
///   dateNumber: "01",
///   desc: "Your Event",
///   yourChoice: true,
///   selectedColor: Colors.blue,
///   unSelectedColor: Colors.grey,
/// )
///
/// // Using the static itemWidth property
/// double width = DateItemWidget.itemWidth;
/// ```
///
/// ### Use Case:
///
/// The `DateItemWidget` class is commonly used in date picker components, event calendars, or any UI where date selection and display are required. It allows developers to customize the appearance of date items based on their selected state.
class DateItemWidget extends StatelessWidget {
  const DateItemWidget({
    required this.date,
    required this.dateNumber,
    this.desc,
    this.yourChoice = false,
    required this.selectedColor,
    required this.unSelectedColor,
    Key? key,
  }) : super(key: key);

  final String date;
  final String dateNumber;
  final String? desc;
  final bool yourChoice;
  final Color selectedColor;
  final Color unSelectedColor;

  static const double itemWidth = 64;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(end: 4),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      width: 60,
      height: 80,
      decoration: BoxDecoration(
        color: (yourChoice)
            ? selectedColor.withOpacity(0.7)
            : Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: (desc != null) ? selectedColor : unSelectedColor,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            date,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: (yourChoice) ? selectedColor : unSelectedColor,
                ),
          ),
          Text(
            dateNumber,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w700,
                color: (yourChoice) ? selectedColor : unSelectedColor),
          ),
          Text(
            (desc != null) ? desc! : '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: (yourChoice) ? selectedColor : unSelectedColor,
                ),
          ),
        ],
      ),
    );
  }
}
