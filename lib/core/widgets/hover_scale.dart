import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

/// Wraps [child] with a subtle scale + cursor change on pointer hover.
///
/// Primarily improves the web/desktop experience; on touch platforms hover
/// events simply never fire, so it degrades gracefully with no cost.
class HoverScale extends StatefulWidget {
  const HoverScale({
    super.key,
    required this.child,
    this.scale = 1.02,
    this.enabled = true,
  });

  final Widget child;
  final double scale;
  final bool enabled;

  @override
  State<HoverScale> createState() => _HoverScaleState();
}

class _HoverScaleState extends State<HoverScale> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.enabled
          ? SystemMouseCursors.click
          : MouseCursor.defer,
      onEnter: (_) => _setHovering(true),
      onExit: (_) => _setHovering(false),
      child: AnimatedScale(
        scale: _hovering && widget.enabled ? widget.scale : 1.0,
        duration: AppDurations.fast,
        curve: Curves.easeOut,
        child: widget.child,
      ),
    );
  }

  void _setHovering(bool value) {
    if (!widget.enabled || _hovering == value) return;
    setState(() => _hovering = value);
  }
}
