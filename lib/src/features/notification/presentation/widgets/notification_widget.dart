import 'dart:async';

import 'package:flutter/material.dart';

/// ## [NotificationWidget] documentation:
///
/// A widget that displays a notification message with customizable colors and animations.
///
/// The [NotificationWidget] is used to display informative messages to the user, such as success
/// messages or error notifications. It animates the message by sliding it from the top of the
/// screen and then hiding it after a specified duration.
///
/// Example usage:
/// ```dart
/// NotificationWidget(
///   message: 'Profile updated successfully!',
///   isSuccess: true,
///   successColor: Colors.green,
///   textColor: Colors.white,
///   radius: 10,
///   seconds: 4,
///   child: YourContentWidget(),
/// )
/// ```
///
/// This widget is often used to provide feedback to the user after completing an action,
/// such as submitting a form or updating user details.
///
class NotificationWidget extends StatefulWidget {
  /// Creates a [NotificationWidget] with customizable parameters.
  ///
  /// The [message] parameter represents the notification message to display.
  ///
  /// The [isSuccess] parameter determines whether the message represents a success or failure.
  ///
  /// The [successColor] parameter sets the background color for success messages.
  ///
  /// The [failureColor] parameter sets the background color for failure messages.
  ///
  /// The [textColor] parameter sets the text color for the message.
  ///
  /// The [radius] parameter sets the border radius for the notification container.
  ///
  /// The [seconds] parameter sets the duration in seconds for displaying the message.
  ///
  /// The [child] parameter represents the child widget where the notification should be displayed.
  ///
  NotificationWidget({
    required this.child,
    required this.message,
    required this.isSuccess,
    this.successColor,
    this.failureColor,
    this.textColor,
    this.radius = 10,
    this.seconds = 4,
    super.key,
  }) {
    assert(
      (isSuccess && successColor != null) ||
          (!isSuccess && failureColor != null),
      'one of the `successColor` or `failureColor` must be initialized',
    );
  }

  final String message;
  final bool isSuccess;
  final Color? successColor;
  final Color? failureColor;
  final Color? textColor;
  final double radius;
  final int seconds;
  final Widget child;

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  double _top = -50;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: widget.seconds ~/ 2),
      () {
        setState(() {
          _top = 50;
        });
        Future.delayed(
          Duration(seconds: (widget.seconds ~/ 2) + 1),
          () {
            setState(() {
              _top = -50;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        AnimatedPositioned(
          left: 0,
          right: 0,
          top: _top,
          duration: Duration(seconds: widget.seconds ~/ 4),
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            decoration: BoxDecoration(
              color: widget.successColor ?? widget.failureColor,
              borderRadius: BorderRadius.circular(widget.radius),
            ),
            child: Text(
              widget.message,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: widget.textColor,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
