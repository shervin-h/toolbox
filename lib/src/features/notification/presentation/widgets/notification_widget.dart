import 'dart:async';

import 'package:flutter/material.dart';

class NotificationWidget extends StatefulWidget {
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
