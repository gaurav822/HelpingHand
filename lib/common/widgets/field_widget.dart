import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:helpinghand/core/app_style.dart';

class FieldWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool hasSuffix;
  final bool hasPrefix;
  final String hintText;
  final String? Function(String?)? validator;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final bool isDropdown;
  final List<String>? dropdownItems;
  final String? dropdownValue;
  final void Function(String?)? onChanged;
  final void Function()? onSuffixClicked;
  final int maxLength;
  final int maxLines;

  const FieldWidget({
    super.key,
    required this.label,
    required this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.hintText="",
    this.isDropdown = false,
    this.hasSuffix=false,
    this.hasPrefix=false,
    this.dropdownItems,
    this.dropdownValue,
    this.onChanged,
    this.onSuffixClicked,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLength = 50,
    this.maxLines = 1
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: style16()),
          const SizedBox(height: 8),
          isDropdown ? _buildDropdownField() : _buildTextField(),
        ],
      ),
    );
  }

  Widget _buildTextField() {
    return TextFormField(
      keyboardType: keyboardType,
      maxLines: maxLines,
      maxLength: maxLength,
      obscureText: obscureText,
      decoration: InputDecoration(
        counterText: '',
        hintText: hintText,
        suffixIcon: hasSuffix?IconButton(
          onPressed: onSuffixClicked,
          icon: suffixIcon!,
        ):null,
          prefixIcon: prefixIcon
      ),
      controller: controller,
      validator: validator,
    );
  }

  Widget _buildDropdownField() {
    
    return DropdownButtonFormField<String>(
      value: dropdownValue,
      onChanged: onChanged,
      items: dropdownItems?.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
      validator: validator,
    );
  }
}
