import 'package:alphatwelve_task/core/utils/toast/custom_toast.dart';
import 'package:flutter/material.dart';

class ToastManager {
  static OverlayEntry? _overlayEntry;
  static bool _isVisible = false;

  static void showToast({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {

    if (_isVisible) {
      _removeToast();
    }

    _isVisible = true;
    
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 16,
        left: 0,
        right: 0,
        child: Material(
          color: Colors.transparent,
          child: CustomToast(
            message: message,
            duration: duration,
            onClose: _removeToast,
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  static void _removeToast() {
    if (_overlayEntry != null && _isVisible) {
      _overlayEntry!.remove();
      _overlayEntry = null;
      _isVisible = false;
    }
  }

  static void showSuccess(BuildContext context, String message) {
    showToast(context: context, message: message);
  }

  static void showError(BuildContext context, String message) {
    showToast(context: context, message: message);
  }

  static void showInfo(BuildContext context, String message) {
    showToast(context: context, message: message);
  }

  static void dismiss() {
    _removeToast();
  }
  
}