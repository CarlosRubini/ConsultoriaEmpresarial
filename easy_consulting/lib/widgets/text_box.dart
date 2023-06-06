import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helpers/global_helper.dart';

class TextBox extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final bool autoFocus;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextEditingController? controller;
  final double paddingLeft;
  final double paddingTop;
  final double paddingRight;
  final double paddingBottom;
  final TextInputType textInputType;
  final Function(String)? onSubmitted;
  final Function()? onLoseFocus;
  final double width;
  final Function? onTap;
  final bool readOnly;
  final bool isDate;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final Function(String)? onChanged;
  final Function(String?)? validator;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign textAlign;
  final Function()? onEditingComplete;
  final Iterable<String>? autofillHints;

  const TextBox(
      {super.key, required this.hintText,
      this.isPassword= false,
      this.autoFocus= false,
      this.focusNode,
      this.nextFocusNode,
      this.controller,
      this.paddingLeft= 32.0,
      this.paddingTop= 0.0,
      this.paddingRight= 32.0,
      this.paddingBottom= 16.0,
      this.textInputType= TextInputType.text,
      this.onSubmitted,
      this.width= double.maxFinite,
      this.onTap,
      this.readOnly= false,
      this.isDate= false,
      this.initialDate,
      this.firstDate,
      this.lastDate,
      this.onChanged,
      this.maxLines= 1,
      this.validator,
      this.inputFormatters,
      this.textAlign= TextAlign.start,
      this.onEditingComplete,
      this.autofillHints,
      this.onLoseFocus});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
            width: width,
            child: Padding(
                padding: EdgeInsets.fromLTRB(paddingLeft, paddingTop,
                    paddingRight, paddingBottom),
                child: Focus(
                    onFocusChange: ((bool hasFocus) => {
                          if (!hasFocus)
                            {
                              if(nextFocusNode != null) nextFocusNode!.requestFocus(),
                              if(onLoseFocus != null) onLoseFocus!()
                            }
                        }),
                    child: TextFormField(
                      autofillHints: autofillHints,
                      inputFormatters: inputFormatters,                
                      validator: (String? term) {
                        if (validator != null) return validator!(term);
                        return null;
                      },
                      readOnly: readOnly || isDate,
                      onTap: () {
                        if (onTap != null) onTap!();
                        if (isDate && !readOnly) {
                          selectDate(
                            context: context,
                            controller: controller,
                          );
                        }
                      },                     
                      decoration: InputDecoration(
                            hintText: hintText,
                            filled: true,
                            fillColor: const Color.fromRGBO(241, 241, 241, 1),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0.5,
                                    color: Color.fromRGBO(241, 241, 241, 1))),
                          ),
                      onEditingComplete: () {
                        if (onEditingComplete != null) {
                          return onEditingComplete!();
                        }
                        return;
                      },
                      textAlign: textAlign,
                      keyboardType: textInputType,
                      obscureText: isPassword,
                      autofocus: autoFocus,
                      textInputAction: TextInputAction.next,
                      focusNode: focusNode,
                      controller: controller,
                      onChanged: (String term) {
                        if (onChanged != null) onChanged!(term);
                      },
                      onFieldSubmitted: (String term) {
                        if (onSubmitted != null) {
                          return onSubmitted!(term);
                        }
                        return;
                      },
                      maxLines: maxLines,
                    )))));
  }

  void selectDate(
      {required BuildContext context,
      required TextEditingController? controller}) {
    DateTime? initialDate = this.initialDate;
    DateTime? firstDate = this.firstDate;
    DateTime? lastDate = this.lastDate;
    initialDate ??= DateTime.now();
    firstDate ??= DateTime(2000);
    lastDate ??= DateTime(3000);
    
    showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    ).then((DateTime? date) => controller!.text = getFormattedDate(date!));
  }
}
