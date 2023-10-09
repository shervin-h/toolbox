import 'package:flutter/material.dart';

/// ## [RetryWidget] Class Documentation
///
/// The `RetryWidget` class is a Flutter widget that provides a user-friendly way to display an error message along with a retry button. It is commonly used to prompt users to retry an action that previously failed, such as network requests or form submissions.
///
/// ### Constructors:
///
/// - `RetryWidget({Key? key, Function()? onPressed, String? message, String? label})`: Constructs an instance of `RetryWidget` with optional parameters.
///
/// ### Properties:
///
/// - `onPressed`: A callback function that is executed when the retry button is pressed. It typically triggers the action that needs to be retried.
///
/// - `message`: An optional string message that describes the error or reason for the retry.
///
/// - `label`: An optional label for the retry button. The default label is "Try Again."
///
/// ### Widgets:
///
/// The `RetryWidget` consists of the following widgets:
///
/// - A text widget displaying the error message in red text if provided.
///
/// - A material button with a red background for retrying the action. The button label defaults to "Try Again."
///
/// ### Usage Example:
///
/// ```dart
/// RetryWidget(
///   onPressed: () {
///     // Retry the action here.
///   },
///   message: 'Failed to load data. Please try again.',
/// )
/// ```
///
/// ### Parameters:
///
/// - `onPressed`: A function that will be called when the retry button is pressed. It is typically used to trigger the action that needs to be retried.
///
/// - `message`: An optional string message that describes the error or reason for the retry. If provided, it will be displayed in red text above the retry button.
///
/// - `label`: An optional string label for the retry button. If not provided, the default label "Try Again" will be used.
///
/// ### Use Case:
///
/// Use the `RetryWidget` in your UI when you want to give users the option to retry an action that has failed, such as reloading data after a network error or resubmitting a form after validation errors.
class RetryWidget extends StatelessWidget {
  const RetryWidget({
    super.key,
    this.onPressed,
    this.message,
    this.label,
  });

  final Function()? onPressed;
  final String? message;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (message != null)
            Text(
              message!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.red,
                  ),
            ),
          if (message != null) const SizedBox(height: 8.0),
          MaterialButton(
            onPressed: onPressed,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            color: Colors.red,
            child: Text(
              label ?? 'Try Again',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
