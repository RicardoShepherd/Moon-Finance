import 'package:flutter/foundation.dart';
import 'package:rive/rive.dart';

class FlutterFlowRiveController extends SimpleAnimation {
  /// Creates a custom Rive animation controller for FlutterFlow.
  ///
  /// [animationName]: The name of the animation to control.
  /// [mix]: The mixing value for the animation.
  /// [autoplay]: Whether the animation should autoplay when initialized.
  /// [shouldLoop]: Whether the animation should loop continuously.
  FlutterFlowRiveController(
    String animationName, {
    double mix = 1,
    bool autoplay = true,
    this.shouldLoop = false,
  }) : super(animationName, mix: mix, autoplay: autoplay);

  /// Whether the animation should loop continuously.
  bool shouldLoop;

  /// Notifies listeners when the animation should be reactivated.
  final _reactivate = ValueNotifier<bool>(false);

  /// Returns the current value of the reactivate flag.
  bool get reactivate => _reactivate.value;

  /// Sets the reactivate flag and notifies listeners if the value changes.
  set reactivate(bool value) {
    if (_reactivate.value != value) {
      _reactivate.value = value;
    }
  }

  /// Returns the ValueListenable for the reactivate flag.
  /// This can be used to listen for changes to the reactivate flag.
  ValueListenable<bool> get changeReactivate => _reactivate;

  /// Checks if the animation instance has reached the end of its timeline.
  /// Returns true if the animation is at its end time, false otherwise.
  bool endOfAnimation(LinearAnimationInstance? instance) {
    if (instance == null) {
      return false;
    }
    return instance.time == instance.animation.endTime;
  }

  /// Initializes the controller with the given artboard.
  /// Sets the reactivate flag to false and calls the super class's init method.
  @override
  bool init(RuntimeArtboard artboard) {
    // The listener for reactivate is handled in the apply method for simplicity
    // and to avoid potential issues with multiple listeners.
    reactivate = false;
    return super.init(artboard);
  }

  // ignore: avoid_renaming_method_parameters
  /// Applies the animation for the elapsed time.
  /// Manages the animation's playback based on reactivate, shouldLoop, and
  /// whether the animation has reached its end.
  @override
  bool apply(RuntimeArtboard artboard, double elapsedSeconds) {
    if (instance == null) {
 return false;
    }

    /// Reset on button press
    if (reactivate) {
      if (endOfAnimation(instance as LinearAnimationInstance?)) {
        instance?.time = 0;
      }
      reactivate = false;
    }

    if (instance == null || endOfAnimation(instance as LinearAnimationInstance?)) {
      isActive = false;
    }

    /// Stop after one loop if not a continuous animation
    if (!shouldLoop &&
        (instance?.animation.loop == Loop.loop ||
            instance?.animation.loop == Loop.pingPong) &&
        instance!.didLoop) {
      isActive = false;
    }

    // If the animation has reached the end and isActive is false (meaning it
    // wasn't set to loop), set isActive to false to stop playback.
    if (!isActive && endOfAnimation(instance as LinearAnimationInstance?)) {
      isActive = false;
    }

    // The issue here is that `instance!` is being accessed potentially before
    // it's guaranteed to be non-null after the checks above.
    instance!
      ..animation.apply(instance!.time, coreContext: artboard, mix: mix)
      ..advance(elapsedSeconds);

    return isActive;
  }
}
