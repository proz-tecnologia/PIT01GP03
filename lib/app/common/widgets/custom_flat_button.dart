import 'package:flutter/material.dart';

class CustomFlatButton extends StatefulWidget {
  final String text;
  final Function()? onPressed;
  final Color color;
  final Color? imageColor;
  final Color textColor;
  final double width;
  final double height;
  final double fontSize;
  final String? image;

  const CustomFlatButton({
    Key? key,
    required this.text,
    this.onPressed,
    required this.color,
    required this.width,
    required this.height,
    required this.fontSize,
    required this.textColor,
    this.image,
    this.imageColor,
  }) : super(key: key);

  @override
  State<CustomFlatButton> createState() => _CustomFlatButtonState();
}

class _CustomFlatButtonState extends State<CustomFlatButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.color,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: widget.onPressed,
        child: Container(
          width: MediaQuery.of(context).size.width * widget.width,
          height: MediaQuery.of(context).size.height * widget.height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: widget.image != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      widget.image!,
                      height: 24,
                      color: widget.imageColor,
                      alignment: Alignment.center,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                    ),
                    Text(
                      widget.text,
                      style: TextStyle(
                          fontSize: widget.fontSize),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.text,
                      style: TextStyle(
                          fontSize: widget.fontSize, color: widget.textColor),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
