import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:textstyle_extensions/textstyle_extensions.dart';
import 'package:flowy_infra/size.dart';
import 'package:flowy_infra/text_style.dart';
import 'package:flowy_infra/theme.dart';
import 'base_styled_button.dart';

class SecondaryTextButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool bigMode;

  const SecondaryTextButton(this.label, {Key? key, this.onPressed, this.bigMode = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle txtStyle = TextStyles.Btn.textColor(Colors.black);
    return SecondaryButton(bigMode: bigMode, onPressed: onPressed, child: Text(label, style: txtStyle));
  }
}

class SecondaryButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final bool bigMode;

  const SecondaryButton({Key? key, required this.child, this.onPressed, this.bigMode = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseStyledButton(
      minWidth: bigMode ? 170 : 78,
      minHeight: bigMode ? 48 : 28,
      contentPadding: EdgeInsets.zero,
      bgColor: Colors.white,
      hoverColor: Colors.grey,
      downColor: Colors.blue,
      outlineColor: Colors.blueAccent,
      borderRadius: bigMode ? Corners.s12Border : Corners.s8Border,
      child: child,
      onPressed: onPressed,
    );
  }
}
