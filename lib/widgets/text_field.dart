import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final double width;
  final IconData? prefixIcon;

  const CustomTextField(
      {super.key,
      this.hintText = '',
      this.isPassword = false,
      this.prefixIcon,
      required this.width});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isObscured;
  late IconData _suffixIcon;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.isPassword;
    _suffixIcon = widget.isPassword ? Icons.visibility_off : Icons.visibility;
  }

  void _toggleVisibility() {
    setState(() {
      _isObscured = !_isObscured;
      _suffixIcon = _isObscured ? Icons.visibility_off : Icons.visibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        obscureText: _isObscured,
        decoration: InputDecoration(
          // prefixIcon: Icon(
          //   widget.prefixIcon,
          //   color: Colors.grey,
          // ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              
      ),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.7)),
          suffixIcon: widget.isPassword
              ? IconButton(
                  color: Colors.grey.withOpacity(0.7),
                  
                  icon: Icon(_suffixIcon),
                  onPressed: _toggleVisibility,
                )
              : null,
        ),
      ),
    );
  }
}
