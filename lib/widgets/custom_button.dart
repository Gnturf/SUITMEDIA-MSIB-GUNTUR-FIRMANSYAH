import 'package:flutter/material.dart';
import 'package:suitmedia_msib_2024/configs/styles/text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final EdgeInsets? margin;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 13,
          ),
          backgroundColor: const Color.fromRGBO(43, 99, 123, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: medium.copyWith(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
