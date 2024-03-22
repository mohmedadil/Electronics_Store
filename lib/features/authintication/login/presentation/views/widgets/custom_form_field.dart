import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hint,
      this.password = false,
      this.onChange,
      this.obsecure = false,
      this.isSecure,
      this.obsecureIcon = true});
  final bool password;
  final void Function()? isSecure;
  final String hint;
  final void Function(String)? onChange;
  final bool obsecure;
  final bool? obsecureIcon;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value!.isEmpty) {
            return 'This Field is required';
          }
        },
        onChanged: onChange,
        obscureText: obsecure,
        decoration: InputDecoration(
            suffixIcon: password
                ? Opacity(
                    opacity: 0.9,
                    child: IconButton(
                      icon: obsecureIcon!
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      onPressed: isSecure,
                    ))
                : null,
            filled: true,
            fillColor: const Color(0xffF7F7F9),
            hintStyle:
                TextStyle(color: const Color(0xff6A6A6A).withOpacity(0.5)),
            hintText: hint,
            border: InputBorder.none),
      ),
    );
  }
}

class CustomTextFormFieldForNumbers extends StatelessWidget {
  const CustomTextFormFieldForNumbers(
      {super.key, required this.hint, this.password = false});
  final bool password;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: TextFormField(
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            counterText: '',
            filled: true,
            fillColor: const Color(0xffF7F7F9),
            hintStyle: TextStyle(
              color: const Color(0xff6A6A6A).withOpacity(0.5),
            ),
            hintText: hint,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            border: InputBorder.none),
      ),
    );
  }
}
