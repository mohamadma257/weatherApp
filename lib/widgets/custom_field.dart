import 'package:flutter/material.dart';

class CustomField extends StatefulWidget {
  CustomField({
    super.key,
    required this.controller,
    required this.text,
    this.isPass = false,
    this.icon,
  });

  final TextEditingController controller;
  final String text;
  final bool isPass;
  final IconData? icon;

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  bool showPass = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          obscureText: widget.isPass ? showPass : false,
          validator: (value) => value!.isEmpty ? 'field is required' : null,
          controller: widget.controller,
          decoration: InputDecoration(
            prefixIcon: widget.icon == null ? null : Icon(widget.icon),
            suffixIcon: widget.isPass
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPass = !showPass;
                      });
                    },
                    icon: Icon(Icons.remove_red_eye))
                : null,
            contentPadding: EdgeInsets.all(16),
            hintText: widget.text,
            label: Text(widget.text),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
