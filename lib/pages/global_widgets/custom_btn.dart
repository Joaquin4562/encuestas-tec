import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
    this.icon,
    this.colorIcon,
    this.fillColor,
    this.splashColr,
    this.colorText,
    required this.label,
    required this.padding,
    this.ftShadow,
  }) : super(key: key);
  final VoidCallback onPressed;
  final IconData? icon;
  final Color? colorIcon;
  final Color? fillColor;
  final Color? splashColr;
  final String label;
  final Color? colorText;
  final double padding;
  final bool? ftShadow;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50.0, right: 50.0),
      child: RawMaterialButton(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: fillColor,
        splashColor: splashColr,
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    shadows: [
                      ftShadow == null ? BoxShadow(
                        offset: Offset(0, 2),
                        blurRadius:  10.0,
                        color: Colors.black
                      ): BoxShadow()
                    ],
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: colorText
                  ),
                ),
              ),
              icon != null ? Icon(
                icon,
                color: colorIcon,
              ): Container()
            ],
          ),
        ),
      ),
    );
  }
}
