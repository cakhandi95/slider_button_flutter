import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:slider_button_component/styles/styles.dart';
import 'package:vibration/vibration.dart';

///
/// Created by Handy on 02/08/24
///

class ButtonSlideComponent extends StatefulWidget {

  /// To make button more customizable, add your child widget.
  final Widget? child;

  /// Sets the radius of corners of a button.
  final double radius;

  /// Use it to define a height and width of the widget.
  final double height;
  final double width;
  final double? buttonSize;

  /// Use this parameter if your slider button is wide and not squared.
  final double? buttonWidth;

  /// Use it to define the color of the widget.
  final Color backgroundColor;
  final Color baseColor;
  final Color highlightedColor;
  final Color buttonColor;

  /// Use this parameter to add a label on the widget.
  final Widget? label;

  /// Gives alignment to the slider icon.
  final Alignment alignLabel;
  final BoxShadow? boxShadow;
  final Widget? icon;

  /// Set to false if you want to deactivate the shimmer effect.
  final bool shimmer;

  /// Set to true to enable vibration feedback on action.
  final bool vibrationFlag;

  /// Set to true to disable the button.
  final bool disable;

  final VoidCallback onSlideCompleted;

  final String messageTooltip;

  const ButtonSlideComponent({
    super.key,
    required this.onSlideCompleted,
    this.radius = 100,
    this.boxShadow,
    this.child,
    this.vibrationFlag = false,
    this.shimmer = true,
    this.height = 70,
    this.buttonSize,
    this.buttonWidth,
    this.width = 270,
    this.alignLabel = Alignment.center,
    this.backgroundColor = const Color(0xffe0e0e0),
    this.baseColor = Colors.black87,
    this.buttonColor = kBlueDark,
    this.highlightedColor = Colors.white,
    this.label,
    this.icon,
    this.disable = false,
    this.messageTooltip = '',
  }) : assert((buttonSize ?? 60) <= height);

  @override
  State<ButtonSlideComponent> createState() => _ButtonSlideComponentState();
}

class _ButtonSlideComponentState extends State<ButtonSlideComponent> {
  double _buttonPosition  = 0.0;
  double _initialPosition = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration (
        color: widget.disable ? Colors.grey.shade700 : widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.radius),
      ),
      alignment: Alignment.centerLeft,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          Container (
            alignment: widget.alignLabel,
            child: widget.shimmer && !widget.disable
                ? Shimmer.fromColors(
              baseColor: widget.disable ? Colors.grey : widget.baseColor,
              highlightColor: widget.highlightedColor,
              child: widget.label ?? const Text(''),
            ) : widget.label,
          ),
          if (widget.disable) ... [
            Tooltip(
              verticalOffset: 50,
              message: widget.messageTooltip,
              child: Container(
                width: widget.width - widget.height,
                height: widget.height,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(
                  left: (widget.height - (widget.buttonSize ?? widget.height * 0.9)) / 2,
                ),
                child: widget.child ??
                    Container(
                      height: widget.buttonSize ?? widget.height,
                      width: widget.buttonSize ?? widget.height,
                      decoration: BoxDecoration(
                        boxShadow: widget.boxShadow != null
                            ? [widget.boxShadow!]
                            : null,
                        color: Colors.grey,
                        borderRadius:
                        BorderRadius.circular(widget.radius),
                      ),
                      child: Center(child: widget.icon),
                    ),
              ),
            )
          ] else ... [
            Positioned(
                left: _buttonPosition,
                child: GestureDetector(
                  onHorizontalDragStart: (start) {
                    _initialPosition = start.localPosition.dx;
                  },
                  onHorizontalDragUpdate: (update) {
                    setState(() => _buttonPosition = (update.localPosition.dx - _initialPosition).clamp(0.0, widget.width - widget.height));
                  },
                  onHorizontalDragEnd: (end) async {
                    bool? hasVibrator = false;
                    if (_buttonPosition >= widget.width - widget.height) {
                      widget.onSlideCompleted();
                      hasVibrator = await Vibration.hasVibrator();
                      if (widget.vibrationFlag && hasVibrator != null && hasVibrator) {
                        Vibration.vibrate(duration: 1500);
                      }
                    }
                    setState(() => _buttonPosition = 0.0);
                    setState(() => _initialPosition = 0.0);
                  },
                  child: Container(
                    width: widget.height,
                    height: widget.height,
                    decoration: BoxDecoration(
                      color: widget.buttonColor,
                      borderRadius: BorderRadius.circular(widget.height / 2),
                    ),
                    child: Center(child: widget.icon),
                  ),
                )
            )
          ],
        ],
      ),
    );
  }
}
