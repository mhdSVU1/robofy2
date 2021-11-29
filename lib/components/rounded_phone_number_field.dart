import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fire_trips/Constants/const_colors.dart';
import 'package:flutter_fire_trips/components/text_field_container.dart';


class RoundedPhoneNumberField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  const RoundedPhoneNumberField({
    Key key,
    this.onChanged, this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: this.controller,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],

        decoration: InputDecoration(
          hintText: "Phone Number",
          icon: Icon(
            Icons.phone,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,

        ),
      ),
    );
  }
}
