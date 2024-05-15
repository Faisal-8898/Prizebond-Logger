import 'package:flutter/material.dart';

// ignore: camel_case_types
class sk {
  static ThemeData _themeData = ThemeData(); // Default theme if not provided

  static setTheme(BuildContext context) {
    _themeData = Theme.of(context);
  }

  static const double height = 35.0;
  static const double width = 100.0;
  static const double fontSize = 16;
  static const double borderWidth = 0.5;

  static SizedBox elevatedButton({
    required Widget content,
    required void Function() onPressed,
    double height = height,
    double width = width,
    double fontSize = fontSize,
    dynamic foreground,
    dynamic background,
  }) {
    background ??= _themeData.colorScheme.primary;
    foreground ??= _themeData.colorScheme.onBackground;
    ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
      textStyle: TextStyle(fontSize: fontSize),
      foregroundColor: foreground,
      backgroundColor: background,
      shape: CircleBorder(),
      padding: const EdgeInsets.all(0),

    );

    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: elevatedButtonStyle,
        child: content,
      ),
    );
  }

  static SizedBox outlinedButton({
    required Widget content,
    required void Function() onPressed,
    double height = height,
    double width = width,
    double fontSize = fontSize,
    double borderWidth = borderWidth,
    dynamic borderColor,
    dynamic foreground,
    dynamic background,
  }) {
    borderColor ??= _themeData.colorScheme.shadow;
    background ??= _themeData.colorScheme.onBackground;
    foreground ??= _themeData.colorScheme.primary;
    ButtonStyle outlinedButtonStyle = OutlinedButton.styleFrom(
      textStyle: TextStyle(fontSize: fontSize),
      side: BorderSide(width: borderWidth, color: borderColor),
      foregroundColor: foreground,
      backgroundColor: background,
      padding: const EdgeInsets.all(0),
    );

    return SizedBox(
      height: height,
      width: width,
      child: OutlinedButton(
        onPressed: onPressed,
        style: outlinedButtonStyle,
        child: content,
      ),
    );
  }

  static SizedBox textButton({
    required String content,
    required void Function() onPressed,
    double height = height,
    double width = width,
    double fontSize = fontSize,
    dynamic foreground,
    dynamic background,
  }) {
    ButtonStyle textButtonStyle = TextButton.styleFrom(
      textStyle: TextStyle(fontSize: fontSize),
      foregroundColor: foreground,
      backgroundColor: background,
    );

    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
        onPressed: onPressed,
        style: textButtonStyle,
        child: Text(content),
      ),
    );
  }

  static Widget dropdownButton<T>({
    required List<T> items,
    required T? value,
    required void Function(T?)? onChanged,
    Widget? hint,
    double? height,
    double? width,
    double? fontSize,
    Widget Function(T)? itemBuilder, // Add this parameter
  }) {
    return SizedBox(
      height: height,
      width: width,
      child: DropdownButton<T>(
        hint: hint,
        value: value,
        items: items
            .map(
              (item) => DropdownMenuItem<T>(
                value: item,
                child: itemBuilder != null
                    ? itemBuilder(item)
                    : Text(
                        item.toString(),
                        style: TextStyle(fontSize: fontSize),
                      ),
              ),
            )
            .toList(),
        onChanged: onChanged,
      ),
    );
  }

  static SizedBox card({
    required Widget content,
    double height = 200,
    double width = 300,
    double marginLeft = 0,
    double marginTop = 0,
    double marginRight = 0,
    double marginBottom = 0,
    double elevation = 15,
  }) {
    return SizedBox(
      height: height,
      width: width,
      child: Card(
        margin: EdgeInsets.only(
          left: marginLeft,
          top: marginTop,
          right: marginRight,
          bottom: marginBottom,
        ),
        elevation: elevation,
        child: content,
      ),
    );
  }

  static Text text({
    required String content,
    Color fontColor = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    double fontSize = 14,
  }) {
    TextStyle textStyle =
        TextStyle(color: fontColor, fontWeight: fontWeight, fontSize: fontSize);

    return Text(
      content,
      style: textStyle,
    );
  }
}
