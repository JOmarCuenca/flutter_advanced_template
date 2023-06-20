import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

abstract class TextModelWidget extends StatelessWidget {
  static const double defaultMinFontSize = 12, defaultMaxFontSize = double.infinity;

  final String text;
  final double minFontSize, maxFontSize;
  final double? fontSize;
  final TextAlign? textAlign;
  final bool? softWrap;
  final bool wrapWords;
  final TextOverflow? overflow;
  final int? maxLines;
  final Color? color;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;

  const TextModelWidget(
    this.text, {
    super.key,
    this.minFontSize = defaultMinFontSize,
    this.maxFontSize = defaultMaxFontSize,
    this.textAlign,
    this.softWrap,
    this.wrapWords = false,
    this.overflow,
    this.maxLines,
    required this.fontSize,
    this.color,
    this.fontWeight,
    this.fontStyle,
  });

  @protected
  TextTheme currentAppTextTheme(BuildContext context) => Theme.of(context).textTheme;

  @protected
  TextStyle widgetTextStyle(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: widgetTextStyle(context).copyWith(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
      ),
      minFontSize: minFontSize,
      maxFontSize: maxFontSize,
      textAlign: textAlign,
      softWrap: softWrap,
      wrapWords: wrapWords,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
