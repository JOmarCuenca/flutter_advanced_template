import 'package:flutter/material.dart';
import 'package:flutter_advanced_template/widgets/text/model.widget.dart';

class H1 extends TextModelWidget {
  static const double _defaultFontSize = 48;

  const H1(
    super.text, {
    super.key,
    super.minFontSize = TextModelWidget.defaultMinFontSize,
    super.maxFontSize = TextModelWidget.defaultMaxFontSize,
    super.textAlign,
    super.softWrap,
    super.wrapWords = false,
    super.overflow,
    super.maxLines,
    super.fontSize = _defaultFontSize,
    super.color,
    super.fontWeight,
    super.fontStyle,
  });

  @override
  TextStyle widgetTextStyle(BuildContext context) => currentAppTextTheme(context).displayLarge ?? const TextStyle();
}

class H1Heavy extends H1 {
  const H1Heavy(
    super.text, {
    super.key,
    super.minFontSize = TextModelWidget.defaultMinFontSize,
    super.maxFontSize = TextModelWidget.defaultMaxFontSize,
    super.textAlign,
    super.softWrap,
    super.wrapWords = false,
    super.overflow,
    super.maxLines,
    super.fontSize = H1._defaultFontSize,
    super.color,
    super.fontWeight = FontWeight.bold,
    super.fontStyle,
  });
}
