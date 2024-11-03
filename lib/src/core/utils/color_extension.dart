import 'package:flutter/material.dart';

extension ColorExtension on Color {
  MaterialColor getMaterial() {
    final colorShades = <int, Color>{
      50: _getShade(this, value: 0.5),
      100: _getShade(this, value: 0.4),
      200: _getShade(this, value: 0.3),
      300: _getShade(this, value: 0.2),
      400: _getShade(this, value: 0.1),
      500: this,
      600: _getShade(this, value: 0.1, darker: true),
      700: _getShade(this, value: 0.15, darker: true),
      800: _getShade(this, value: 0.2, darker: true),
      900: _getShade(this, value: 0.25, darker: true),
    };
    return MaterialColor(value, colorShades);
  }

  Color _getShade(Color color, {bool darker = false, double value = .1}) {
    assert(value >= 0 && value <= 1, 'shade values must be between 0 and 1');

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness(
      (darker ? (hsl.lightness - value) : (hsl.lightness + value)).clamp(0.0, 1.0),
    );

    return hslDark.toColor();
  }
}
