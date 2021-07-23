import 'package:flutter/material.dart';

class CredentialInputWidget extends StatelessWidget {
  CredentialInputWidget(
      {Key? key,
      this.textEditingController,
      this.hint,
      this.prefixIcon,
      this.obscureText,
      this.textInputAction = TextInputAction.done})
      : super(key: key);

  final TextEditingController? textEditingController;
  final String? hint;
  final Widget? prefixIcon;
  final bool? obscureText;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      textInputAction: textInputAction,
      maxLines: 1,
      keyboardType: TextInputType.text,
      cursorColor: Theme.of(context).colorScheme.onPrimary,
      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      controller: textEditingController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          hintText: hint,
          hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary.withAlpha(150)),
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
          fillColor:
              Theme.of(context).colorScheme.secondaryVariant.withAlpha(120),
          filled: true),
    );
  }
}

class EditProfileInputWidget extends StatelessWidget {
  EditProfileInputWidget({
    Key? key,
    required this.label,
    this.textEditingController,
    this.text,
    this.prefixIcon,
    this.obscureText,
    this.textInputAction = TextInputAction.done,
    this.readOnly = false,
  }) : super(key: key);

  final TextEditingController? textEditingController;
  final String label;
  final String? text;
  final Widget? prefixIcon;
  final bool? obscureText;
  final TextInputAction textInputAction;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary.withAlpha(130)),
        ),
        SizedBox(height: 8),
        TextFormField(
          readOnly: this.readOnly,
          initialValue: text,
          obscureText: obscureText ?? false,
          textInputAction: textInputAction,
          maxLines: 1,
          keyboardType: TextInputType.text,
          cursorColor: Theme.of(context).colorScheme.onPrimary,
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          controller: textEditingController,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              prefixIcon: prefixIcon,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none),
              fillColor: Theme.of(context).colorScheme.secondary.withAlpha(120),
              filled: true),
        ),
      ],
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: double.infinity,
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Theme.of(context).colorScheme.secondary,
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
