// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AppTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String hinText;
  final bool obscureText;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextInputType keyboardType;
  final List<String? Function(String?)> validators;
  void Function(String)? onChanged;
  final List<String>? autofillHints;

  AppTextfield({
    Key? key,
    this.controller,
    required this.hinText,
    this.obscureText = false,
    this.readOnly = false,
    this.onTap,
    this.keyboardType = TextInputType.text,
    this.validators = const [],
    this.onChanged,
    this.autofillHints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        controller: controller,
        autofillHints: autofillHints,
        onChanged: onChanged,
        obscureText: obscureText,
        validator: FormBuilderValidators.compose(validators),
        readOnly: readOnly,
        keyboardType: keyboardType,
        onTap: onTap,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hinText,
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
      ),
    );
  }
}
