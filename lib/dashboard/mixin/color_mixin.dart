import 'dart:math';
import 'package:flutter/material.dart';

mixin ColorGenerator {
  final List<Color> _generatedColors = [];
  final Random _random = Random();

  /// Generates a random color ensuring it's not similar to existing colors
  Color generateRandomColor() {
    Color newColor;

    do {
      newColor = Color.fromARGB(
        255, // Full opacity
        _random.nextInt(256), // Red
        _random.nextInt(256), // Green
        _random.nextInt(256), // Blue
      );
    } while (_isSimilarToExistingColors(newColor));

    _generatedColors.add(newColor);
    return newColor;
  }

  /// Checks if the new color is too similar to any of the previously generated colors
  bool _isSimilarToExistingColors(Color color) {
    const int threshold = 50; // Adjust threshold for similarity sensitivity
    for (Color existingColor in _generatedColors) {
      if (_calculateColorDifference(color, existingColor) < threshold) {
        return true;
      }
    }
    return false;
  }

  /// Calculates the difference between two colors
  int _calculateColorDifference(Color color1, Color color2) {
    int redDiff = (color1.red - color2.red).abs();
    int greenDiff = (color1.green - color2.green).abs();
    int blueDiff = (color1.blue - color2.blue).abs();

    return redDiff + greenDiff + blueDiff;
  }

  /// Get all generated colors
  List<Color> getGeneratedColors() => _generatedColors;
}
