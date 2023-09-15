import 'package:flutter/material.dart';
import 'package:toolbox/src/core/utils/inner_shadow.dart';

/// ## [InnerShadowWidget] documentation :
///
/// A custom widget that adds an inner shadow effect to its child.
///
/// The [InnerShadowWidget] allows you to create containers with inner shadow
/// effects, providing a visually appealing design to your Flutter app's user
/// interface.
///
/// You can customize the shadow color, container size, corner radius, gradient
/// background, and padding.
class InnerShadowWidget extends StatelessWidget {
  const InnerShadowWidget({
    required this.child,
    required this.shadowColor,
    required this.width,
    required this.height,
    this.gradiantColors,
    this.radius = 0,
    this.padding,
    Key? key,
  }) : super(key: key);

  /// The color of the inner shadow.
  final Color shadowColor;

  /// The width of the container.
  final double width;

  /// The height of the container.
  final double height;

  /// The child widget that will be wrapped with the inner shadow effect.
  final Widget child;

  /// An optional list of colors to create a gradient background.
  /// Defaults to [Colors.transparent].
  final List<Color>? gradiantColors;

  /// An optional value to set the corner radius of the container,
  /// creating rounded corners. Defaults to 0.
  final double radius;

  /// An optional value to add padding around the child widget,
  /// controlling the spacing between the inner shadow and the child.
  /// Defaults to EdgeInsets.all(8).
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Stack(
        alignment: Alignment.center,
        children: [
          InnerShadow(
            shadows: [
              Shadow(
                color: shadowColor,
                blurRadius: 5,
              ),
            ],
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: gradiantColors ?? [Colors.transparent],
                ),
              ),
            ),
          ),
          Container(
            padding: padding ?? const EdgeInsets.all(8),
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}
