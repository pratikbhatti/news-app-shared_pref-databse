import 'package:demo50/utility/constant/color_style.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomeWidgets {
  CustomeWidgets._();
  static CustomeWidgets customeWidgets = CustomeWidgets._();

  /// custom textfield
  Widget custom_textfield(
      {required String label_text,
      required String hint_text,
      required Icon icon,
      required TextEditingController txt_controller}) {
    return TextFormField(
      controller: txt_controller,
      decoration: InputDecoration(
        labelText: "$label_text",
        labelStyle: TextStyle(color: ColorStyle.black45),
        hintText: "$hint_text",
        hintStyle: TextStyle(color: ColorStyle.greyShade400),
        prefixIcon: icon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorStyle.light_brown),
          borderRadius: BorderRadius.circular(15.0),
        ),
        border: new OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          borderSide: new BorderSide(color: ColorStyle.light_brown),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          borderSide: BorderSide(
            width: 1,
            color: ColorStyle.dark_brown,
          ),
        ),
      ),
    );
  }

  /// custom textfield for the password
  Widget custom_textfield_password(
      {required String label_text,
      required String hint_text,
      required Icon icon,
      required TextEditingController txt_controller}) {
    return TextFormField(
      controller: txt_controller,
      obscureText: true,
      decoration: InputDecoration(
        labelText: "$label_text",
        labelStyle: TextStyle(color: ColorStyle.black45),
        hintText: "$hint_text",
        hintStyle: TextStyle(color: ColorStyle.greyShade400),
        prefixIcon: icon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorStyle.light_brown),
          borderRadius: BorderRadius.circular(15.0),
        ),
        border: new OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          borderSide: new BorderSide(color: ColorStyle.light_brown),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          borderSide: BorderSide(
            width: 1,
            color: ColorStyle.dark_brown,
          ),
        ),
      ),
    );
  }

  /// height sizebox
  Widget heightSizeBox({required double number}) {
    return SizedBox(
      height: number,
    );
  }

  /// width sizebox
  Widget widthSizeBox({required double number}) {
    return SizedBox(
      width: number,
    );
  }

  /// flutter toast
  void errorToast({required String msg}) {
    Fluttertoast.showToast(
      msg: "$msg",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }
}
