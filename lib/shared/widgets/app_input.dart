import 'package:annonceflash_project/shared/extensions/context_extensions.dart';
import 'package:annonceflash_project/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AppInput extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final String? initialValue;
  final String? label;
  final bool readOnly;
  final bool enable;
  final AutovalidateMode autoValidate;
  final TextAlign textAlign;
  final Function(String value)? onChange;
  final ValueChanged<String>? onSubmitted;
  final List<String? Function(String?)> validators;
  final TextInputAction? textInputAction;
  final TextInputType keyboardType;
  final bool? hideText;
  final Widget? suffixIcon;
  final Widget? prefix;
  final bool showEyes;
  final bool obscureText;
  final int minLines, maxLines;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final List<TextInputFormatter>? inputFormatters;
  final String? prefixText;
  final Color textColor;
  final Color? cursorColor;
  final Color errorColor;
  final VoidCallback? onTap;
  final bool required;
  final List<String>? autofillHints;
  final int? maxLength;
  final bool showHelper;
  final EdgeInsets? contentPadding;
  final Widget? eye;
  final Widget? eyeClosed;
  final Widget? labelRight;
  final Color fillColor;

  const AppInput({
    super.key,
    this.controller,
    this.hint,
    this.initialValue,
    this.label,
    this.readOnly = false,
    this.enable = true,
    this.autoValidate = AutovalidateMode.disabled,
    this.textAlign = TextAlign.start,
    this.onChange,
    this.textInputAction,
    this.keyboardType = TextInputType.text,
    this.hideText,
    this.suffixIcon,
    this.prefix,
    this.showEyes = false,
    this.obscureText = false,
    this.minLines = 1,
    this.maxLines = 1,
    this.focusNode,
    this.nextNode,
    this.inputFormatters,
    this.prefixText,
    this.textColor = AppColors.black,
    this.cursorColor,
    this.errorColor = AppColors.red400,
    this.validators = const [],
    this.onTap,
    this.required = false,
    this.autofillHints,
    this.maxLength,
    this.showHelper = true,
    this.contentPadding = const EdgeInsets.only(
      right: 10,
      top: 8,
      bottom: 8,
      left: 16,
    ),
    this.eye,
    this.eyeClosed,
    this.onSubmitted,
    this.labelRight,
    this.fillColor = AppColors.inputFillColors,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool _isObscure = true;
  @override
  void initState() {
    setState(() {
      widget.hideText != null
          ? _isObscure = widget.hideText!
          : _isObscure = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.hideText != null) {
      _isObscure = widget.hideText!;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(
              bottom: 6,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${widget.label}",
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                const Spacer(),
                if (widget.labelRight != null) widget.labelRight!
              ],
            ),
          ),
        TextFormField(
          controller: widget.controller,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17.sp,
            color: AppColors.black,
          ),
          buildCounter: !widget.showHelper
              ? (
                  context, {
                  required currentLength,
                  required isFocused,
                  maxLength,
                }) =>
                  Container()
              : null,
          onTap: widget.onTap,
          initialValue: widget.initialValue,
          enabled: widget.enable,
          validator: FormBuilderValidators.compose(widget.validators),
          inputFormatters: widget.inputFormatters,
          readOnly: widget.readOnly,
          maxLength: widget.maxLength,
          onChanged: widget.onChange,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          focusNode: widget.focusNode,
          autovalidateMode: widget.autoValidate,
          keyboardType: widget.keyboardType,
          autofillHints: widget.autofillHints,
          cursorColor: widget.cursorColor,
          textAlign: widget.textAlign,
          obscureText: widget.obscureText ? _isObscure : false,
          textInputAction: widget.nextNode != null
              ? TextInputAction.next
              : (widget.textInputAction ?? TextInputAction.done),
          onFieldSubmitted: widget.nextNode == null
              ? widget.onSubmitted
              : (value) {
                  FocusScope.of(context).requestFocus(widget.nextNode);
                  if (widget.onSubmitted != null) {
                    widget.onSubmitted!(value);
                  }
                },
          decoration: InputDecoration(
            hintText: widget.hint,
            fillColor: widget.fillColor,
            filled: true,
            hintStyle: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 15.sp,
              color: AppColors.gray400,
            ),
            suffixIcon: (widget.showEyes == true && widget.obscureText == true)
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    child: _isObscure
                        ? widget.eye ??
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 8.h,
                              ),
                              child: const Icon(
                                Icons.visibility_outlined,
                                size: 25,
                                color: AppColors.iconColor,
                              ),
                            )
                        : widget.eyeClosed ??
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 8.h,
                              ),
                              child: const Icon(
                                Icons.visibility_off_outlined,
                                size: 25,
                                color: AppColors.iconColor,
                              ),
                            ),
                  )
                : widget.suffixIcon,
            contentPadding: widget.contentPadding,
            prefixIcon: widget.prefix,
          ),
        ),
      ],
    );
  }
}

extension on int {
  get sp => null;
  
  get w => null;
  
  get h => null;
}
