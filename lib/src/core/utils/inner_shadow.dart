import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// # [InnerShadow] Documentation
///
/// ## Class Overview: [InnerShadow]
/// This class is used to give shadows inside widgets
///
/// ## Constructors:
///   - [InnerShadow] : Constructs a [InnerShadow] with the provided parameters like a below snippet.
///
/// ```dart
///  const InnerShadow({
///    Key? key,
///    this.shadows = const <Shadow>[],
///    Widget? child,
///  }) : super(key: key, child: child);
/// ```
///
/// and using like a below snippet:
/// ```dart
///  InnerShadow(
///    shadows: [
///      Shadow(
///        color: Theme.of(context).extension<ForegroundPallet>()!.foreground3!.withOpacity(0.8),
///        blurRadius: 5,
///      ),
///    ],
///    child: Container(
///      width: 48,
///      height: 48,
///      decoration: BoxDecoration(
///        borderRadius: BorderRadius.circular(radius),
///        gradient: LinearGradient(
///          begin: Alignment.topLeft,
///          end: Alignment.bottomRight,
///          colors: gradiantColors ?? [Colors.transparent],
///        ),
///      ),
///    ),
///  ),
/// ```
///
/// ## Parameters:
///   - [key] (optional): A key for pass to parent .
///   - [shadows] (optional): List of `Shadow` default is an empty list
///   - [child] (optional): The widget we want to shade. The child is given to the parent widget
///
class InnerShadow extends SingleChildRenderObjectWidget {
  const InnerShadow({
    Key? key,
    this.shadows = const <Shadow>[],
    Widget? child,
  }) : super(key: key, child: child);

  final List<Shadow> shadows;

  @override
  RenderObject createRenderObject(BuildContext context) {
    final renderObject = _RenderInnerShadow();
    updateRenderObject(context, renderObject);
    return renderObject;
  }

  @override
  void updateRenderObject(
      BuildContext context, _RenderInnerShadow renderObject) {
    renderObject.shadows = shadows;
  }
}

class _RenderInnerShadow extends RenderProxyBox {
  late List<Shadow> shadows;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) return;
    final bounds = offset & size;

    context.canvas.saveLayer(bounds, Paint());
    context.paintChild(child!, offset);

    for (final shadow in shadows) {
      final shadowRect = bounds.inflate(shadow.blurSigma);
      final shadowPaint = Paint()
        ..blendMode = BlendMode.srcATop
        ..colorFilter = ColorFilter.mode(shadow.color, BlendMode.dstOver)
        ..imageFilter = ImageFilter.blur(
            sigmaX: shadow.blurSigma, sigmaY: shadow.blurSigma);
      context.canvas
        ..saveLayer(shadowRect, shadowPaint)
        // ..rotate(-0.02)
        ..translate(shadow.offset.dx, shadow.offset.dy);
      context.paintChild(child!, offset);
      context.canvas.restore();
    }

    context.canvas.restore();
  }
}
