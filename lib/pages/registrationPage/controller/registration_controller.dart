import 'package:demo50/utility/constant/custome_widgets.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RegistrationController extends GetxController {
  TextEditingController reg_nametxt = TextEditingController();
  TextEditingController reg_emailtxt = TextEditingController();
  TextEditingController reg_passwordtxt = TextEditingController();
  TextEditingController reg_repasswordtxt = TextEditingController();

  bool emailValidate(String email) {
    bool isvalid = EmailValidator.validate(email);
    if (isvalid == false) {
      return isvalid;
    } else {
      return isvalid;
    }
  }
}
