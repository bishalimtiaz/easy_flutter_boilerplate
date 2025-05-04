import 'package:flutter/material.dart';

extension RouteExtension on BuildContext {
  Future<T?> pushModalBottomSheet<T extends Object?>({
    required WidgetBuilder builder,
    required String routeName,
    Color? backgroundColor,
    String? barrierLabel,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    Color? barrierColor,
    bool isScrollControlled = false,
    double scrollControlDisabledMaxHeightRatio = 9.0 / 16.0,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    bool? showDragHandle,
    bool useSafeArea = false,
    AnimationController? transitionAnimationController,
    Offset? anchorPoint,
    AnimationStyle? sheetAnimationStyle,
  }) {
    assert(
    (this as Element).mounted,
    'BuildContext is not mounted. Cannot push ModalBottomSheet with routeName "$routeName".',
    );

    return showModalBottomSheet<T>(
      context: this,
      routeSettings: RouteSettings(name: routeName),
      builder: builder,
      backgroundColor: backgroundColor,
      barrierLabel: barrierLabel,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      constraints: constraints,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      scrollControlDisabledMaxHeightRatio: scrollControlDisabledMaxHeightRatio,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      showDragHandle: showDragHandle,
      useSafeArea: useSafeArea,
      transitionAnimationController: transitionAnimationController,
      anchorPoint: anchorPoint,
      sheetAnimationStyle: sheetAnimationStyle,
    );
  }

  // --- Updated pushDialog method ---
  Future<T?> pushDialog<T extends Object?>({
    required WidgetBuilder builder,
    required String routeName,
    bool isFullScreenDialog = false, // New parameter, default to false
    // --- Parameters for standard dialog (isFullScreenDialog = false) ---
    bool barrierDismissible = true,
    Color? barrierColor, // Defaults to Colors.black54
    String? barrierLabel,
    bool useSafeArea = true, // For showDialog's internal safe area usage
    Offset? anchorPoint,    // Specific to showDialog
    // --- Parameters applicable to both modes ---
    bool useRootNavigator = false,
  }) {
    // Basic mounted check (best effort for BuildContext)
    // Note: `mounted` is truly reliable only on State objects.
    // Casting to Element is a common pattern in extensions but might fail
    // if the BuildContext isn't an Element context.
    assert(
    (this as Element).mounted,
    'BuildContext is not mounted. Cannot push Dialog/Route with routeName "$routeName".',
    );

    if (isFullScreenDialog) {
      // --- Use Navigator.push for a full-screen modal page route ---
      // This behaves like a regular page navigation regarding system UI (status bar)
      return Navigator.of(this, rootNavigator: useRootNavigator).push<T>(
        MaterialPageRoute<T>(
          builder: builder, // Your builder provides the content (e.g., a Scaffold)
          settings: RouteSettings(name: routeName),
          fullscreenDialog: true, // Ensures modal presentation (usually slide up/down)
          // and treats it as a full page regarding UI.
        ),
      );
    } else {
      // --- Use showDialog for a standard modal dialog ---
      return showDialog<T>(
        context: this,
        routeSettings: RouteSettings(name: routeName),
        builder: builder,
        barrierDismissible: barrierDismissible,
        barrierColor: barrierColor,
        barrierLabel: barrierLabel,
        useSafeArea: useSafeArea, // How showDialog positions itself relative to safe area
        useRootNavigator: useRootNavigator,
        anchorPoint: anchorPoint,
      );
    }
  }
}