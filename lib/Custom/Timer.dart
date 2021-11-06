
// ignore_for_file: file_names

import 'dart:math' as Math;
import 'package:flutter/material.dart';

/// A Simple Timer Widget
///
/// The timer will take the size of its parent
class SimpleTimer extends StatefulWidget {

  SimpleTimer({
    Key? key,
    required this.duration,
    this.onStart,
    this.onEnd,
    this.valueListener,
    this.progressTextFormatter,
    this.controller,
    this.status,
    this.progressTextStyle,
    this.delay = const Duration(seconds: 0),
    this.timerStyle = TimerStyle.ring,
    this.displayProgressIndicator = true,
    this.displayProgressText = true,
    this.progressTextCountDirection = TimerProgressTextCountDirection.count_down,
    this.progressIndicatorDirection = TimerProgressIndicatorDirection.clockwise,
    this.backgroundColor = Colors.grey,
    this.progressIndicatorColor = Colors.green,
    this.startAngle = Math.pi * 1.5,
    this.strokeWidth = 5.0,
  }):assert(!(status == null && controller == null), "No Controller or Status has been set; Please set either the controller (TimerController) or the status (TimerStatus) property - only should can be set"),
        assert(status == null || controller == null, "Both Controller and Status have been set; Please set either the controller (TimerController) or the status (TimerStatus) - only one should be set"),
        assert(displayProgressIndicator || displayProgressText,
        "At least either displayProgressText or displayProgressIndicator must be set to True"),
        super(key: key);

  final Duration duration;
  final Duration delay;
  final TimerController? controller;
  final TimerStatus? status;
  final TimerStyle timerStyle;
  final String Function(Duration timeElapsed)? progressTextFormatter;
  final VoidCallback? onStart;
  final VoidCallback? onEnd;
  final void Function(Duration timeElapsed)? valueListener;
  final TimerProgressTextCountDirection progressTextCountDirection;
  final TimerProgressIndicatorDirection progressIndicatorDirection;
  final bool displayProgressText;
  final TextStyle? progressTextStyle;
  final bool displayProgressIndicator;
  final Color progressIndicatorColor;
  final Color backgroundColor;
  final double startAngle;
  final double strokeWidth;

  @override
  State<StatefulWidget> createState() {
    return TimerState();
  }
}

class TimerState extends State<SimpleTimer> with SingleTickerProviderStateMixin {
  late TimerController controller;
  bool _useLocalController = false;
  bool wasActive = false;
  late var width, height;

  @override
  void initState() {
    if(widget.controller == null) {
      controller = TimerController(this);
      _useLocalController = true;
    } else {
      controller = widget.controller!;
    }
    controller.duration = widget.duration;
    controller._setDelay(widget.delay);
    if(_useLocalController && (widget.status == TimerStatus.start)) {
      _startTimer(true);
    }
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height * .5,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Align(     
            alignment: FractionalOffset.center,
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(border: Border.all(width: 5, color: Colors.black)),
                    
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: Align(
                      alignment: FractionalOffset.center,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: AnimatedBuilder(
                            animation: controller,
                            builder: (context, child) {
                              return Text(getProgressText(), style: getProgressTextStyle());
                            }
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
        )
    );
  }

  TextStyle getProgressTextStyle() {
    return TextStyle(fontSize: Theme.of(context).textTheme.headline4!.fontSize).merge(widget.progressTextStyle);
  }


  void _startTimer([bool useDelay = true]) {
    if(useDelay && !controller._wasActive) {
      controller._wasActive = true;
      Future.delayed(widget.delay, () {
        if(mounted && (widget.status == TimerStatus.start)) {
          controller.forward();
        }
      });
    } else {
      controller.forward();
    }
  }

  String getProgressText() {
    Duration duration = controller.duration! * controller.value;
    if(widget.progressTextCountDirection == TimerProgressTextCountDirection.count_down) {
      duration = Duration(seconds: controller.duration!.inSeconds - duration.inSeconds);
    }
    if(widget.progressTextFormatter == null) {
      return "${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, "0")}";
    }
    return widget.progressTextFormatter!(duration);
  }


}

class TimerPainter extends CustomPainter {
  final Animation<double> animation;
  TimerProgressIndicatorDirection progressIndicatorDirection;
  TimerStyle timerStyle;
  Color progressIndicatorColor, backgroundColor;
  double startAngle;
  double strokeWidth;

  TimerPainter({
    required this.animation,
    this.progressIndicatorDirection = TimerProgressIndicatorDirection.clockwise,
    this.progressIndicatorColor = Colors.green,
    this.backgroundColor = Colors.grey,
    this.timerStyle = TimerStyle.ring,
    this.startAngle = Math.pi * 1.5,
    this.strokeWidth = 5.0
  }) : super(repaint: animation);

  PaintingStyle getPaintingStyle() {
    switch(timerStyle) {
      case TimerStyle.ring:
        return PaintingStyle.stroke;
      case TimerStyle.expanding_sector:
        return PaintingStyle.fill;
      case TimerStyle.expanding_circle:
        return PaintingStyle.fill;
      case TimerStyle.expanding_segment:
        return PaintingStyle.fill;
      default:
        timerStyle = TimerStyle.ring;
        return PaintingStyle.stroke;
    }
  }

  double getProgressRadius(double circleRadius) {
    if(timerStyle == TimerStyle.expanding_circle) {
      circleRadius = circleRadius * animation.value;
    }
    return circleRadius;
  }

  double getProgressSweepAngle() {
    double progress = 2 * Math.pi;
    if(timerStyle == TimerStyle.expanding_circle) {
      return progress;
    }
    progress = animation.value * progress;
    if (progressIndicatorDirection == TimerProgressIndicatorDirection.counter_clockwise) {
      progress = -progress;
    }
    return progress;
  }

  double getStartAngle() {
    if (progressIndicatorDirection == TimerProgressIndicatorDirection.both) {
      return (startAngle - (Math.pi * animation.value)).abs();
    }
    return startAngle;
  }

  bool shouldUseCircleCenter() {
    if(timerStyle == TimerStyle.ring) {
      return false;
    } else if(timerStyle == TimerStyle.expanding_segment) {
      return false;
    }
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double radius = Math.min(size.width, size.height) / 2;
    final Offset center = size.center(Offset.zero);
    final Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = getPaintingStyle();

    canvas.drawCircle(center, radius, paint);

    Rect rect = Rect.fromCircle(center: center, radius: getProgressRadius(radius));
    paint.color = progressIndicatorColor;
    canvas.drawArc(rect, getStartAngle(), getProgressSweepAngle(), shouldUseCircleCenter(), paint);
  }

  @override
  bool shouldRepaint(TimerPainter oldDelegate) {
    return animation.value != oldDelegate.animation.value ||
        oldDelegate.progressIndicatorColor != progressIndicatorColor ||
        backgroundColor != oldDelegate.backgroundColor;
  }
}

class TimerController extends AnimationController {

  bool _wasActive = false;

  Duration? _delay;

  TimerController(TickerProvider vsync) : super(vsync: vsync);

  Duration? get delay => _delay;

  /// Sets the animation delay
  void _setDelay(Duration delay) {
    this._delay = delay;
  }

  /// Calculates controller start value from specified duration [startDuration]
  double? _calculateStartValue(Duration? startDuration) {
    startDuration = (startDuration != null && (startDuration > this.duration!)) ? this.duration : startDuration;
    return startDuration == null ? null : (1 - (startDuration.inMilliseconds / this.duration!.inMilliseconds));
  }

  /// This starts the controller animation.
  ///
  /// If [startFrom] is specified, the new value is calculated
  /// and starts from that value, rather than from the [lowerBound]
  void start({bool useDelay = true, Duration? startFrom}) {
    if(useDelay && !_wasActive && (_delay != null)) {
      _wasActive = true;
      Future.delayed(_delay!, () {
        this.forward(from: _calculateStartValue(startFrom));
      });
    } else {
      this.forward(from: _calculateStartValue(startFrom));
    }
  }

  /// This pauses the animation
  void pause() {
    this.stop();
  }

  /// This resets the value back to the [lowerBound]
  @override
  void reset() {
    _wasActive = false;
    super.reset();
  }

  /// This resets and starts the controller animation.
  ///
  /// If [startFrom] is specified, the animation value is calculated
  /// and starts from that value, rather than from the [lowerBound]
  void restart({bool useDelay = true, Duration? startFrom}) {
    this.reset();
    this.start(startFrom: startFrom);
  }

  /// This Reduces the length of time elapsed by the specified duration.
  ///
  /// This doesn't override the initial SimpleTimer widget duration
  /// The specified duration is used to calculate the start value
  ///
  /// The [start] value sets whether or not start the timer after the
  /// value change (defaults to `false`).
  ///
  /// The [animationDuration] value sets the length of time used to animate
  /// from the previous value to the new value
  void add(Duration duration, {bool start = false, Duration changeAnimationDuration = const Duration(seconds: 0)}) {
    duration = (duration > this.duration!) ? this.duration! : duration;
    double newValue = this.value - (duration.inMilliseconds / this.duration!.inMilliseconds);
    this.animateBack(newValue, duration: changeAnimationDuration);
    if (start) {
      this.forward();
    }
  }

  /// This increases the length of time elapsed by the specified duration [duration].
  ///
  /// This doesn't override the initial SimpleTimer widget duration.
  /// The specified duration is used to calculate the start value
  ///
  /// The [start] value sets whether or not start the timer after the
  /// value change (defaults to `false`).
  ///
  /// The [animationDuration] value sets the length of time used to animate
  /// from the previous value to the new value
  void subtract(Duration duration, {bool start = false, Duration changeAnimationDuration = const Duration(seconds: 0)}) {
    duration = (duration > this.duration!) ? this.duration! : duration;
    double newValue = this.value + (duration.inMilliseconds / this.duration!.inMilliseconds);
    this.animateTo(newValue, duration: changeAnimationDuration);
    if (start) {
      this.forward();
    }
  }

}

enum TimerStatus
{
  start,
  pause,
  reset,
}

enum TimerProgressTextCountDirection
{
  count_down,
  count_up,
}

enum TimerProgressIndicatorDirection
{
  clockwise,
  counter_clockwise,
  both
}

// test
enum TimerStyle {
  ring,
  expanding_sector,
  expanding_segment,
  expanding_circle
}