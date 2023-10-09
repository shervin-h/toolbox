import 'dart:async';

import 'package:flutter/material.dart';

/// # [PeriodicRefreshWidget] documentation :
///
/// A custom widget for periodic data refreshing with a built-in pull-to-refresh mechanism.
///
/// The `PeriodicRefreshWidget` is designed to periodically refresh its content by calling
/// the specified `onLoad` callback function after a certain interval defined by `seconds`.
/// It also provides a pull-to-refresh mechanism for manual refreshing.
///
/// Example usage:
///
/// ```dart
/// PeriodicRefreshWidget(
///   seconds: 5,
///   onLoad: () {
///     // Perform data fetching or refreshing logic here.
///     // This callback will be executed every 5 seconds.
///   },
///   child: YourContentWidget(),
/// )
/// ```
class PeriodicRefreshWidget extends StatefulWidget {
  const PeriodicRefreshWidget({
    required this.child,
    required this.onLoad,
    this.seconds = 10,
    this.message,
    Key? key,
  }) : super(key: key);

  /// The child widget that will be displayed within the `PeriodicRefreshWidget`.
  final Widget child;

  /// The interval in seconds at which the `onLoad` callback will be executed periodically.
  final int seconds;

  /// The message to display when a user tries to refresh while a refresh is in progress.
  final String? message;

  /// A callback function to perform data loading or refreshing.
  final dynamic Function() onLoad;

  @override
  State<PeriodicRefreshWidget> createState() => _PeriodicRefreshWidgetState();
}

class _PeriodicRefreshWidgetState extends State<PeriodicRefreshWidget> {
  bool _isRefreshing = true;

  dynamic _callback;

  dynamic get callback => _callback;

  Future<void> refreshData() async {
    if (_isRefreshing) {
      _isRefreshing = false;
      _callback = widget.onLoad.call();

      /// Set a timer to re-enable refreshing after the specified interval.
      Timer(
        Duration(seconds: widget.seconds),
        () {
          _isRefreshing = true;
        },
      );
    } else {
      /// Display a failure message when a refresh is already in progress.
      // show toast
      debugPrint(widget.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refreshData,
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      child: widget.child,
    );
  }
}
