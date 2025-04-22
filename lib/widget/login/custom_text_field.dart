import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool isPassword;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final VoidCallback? onPrefixTap;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final Color borderColor;
  final Color iconColor;

  const CustomTextField({
    Key? key,
    this.controller,
    required this.hintText,
    required this.isPassword,
    this.validator,
    this.prefixIcon,
    this.onPrefixTap,
    this.suffixIcon,
    this.onSuffixTap,
    this.borderColor = Colors.black,
    this.iconColor = Colors.black,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = true;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _isObscured : false,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Colors.grey[600],
          fontWeight: FontWeight.bold,
        ),

        //Kustomisasi border
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),

        //Ikon prefix
        prefixIcon:
            widget.isPassword
                ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                  child: Icon(
                    _isObscured ? Icons.visibility : Icons.visibility_off,
                    color: widget.iconColor, // Warna ikon
                  ),
                )
                : widget.prefixIcon != null
                ? Icon(widget.prefixIcon, color: widget.iconColor)
                : null,
      ),
    );
  }
}
