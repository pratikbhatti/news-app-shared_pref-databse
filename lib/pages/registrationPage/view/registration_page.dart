import 'package:demo50/pages/loginPage/view/login_page.dart';
import 'package:demo50/pages/registrationPage/controller/registration_controller.dart';
import 'package:demo50/utility/constant/custome_widgets.dart';
import 'package:demo50/utility/helpers/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  RegistrationController registrationController =
      Get.put(RegistrationController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/images/background.jpg",
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.width / 2.7,
                      child: Image.asset(
                        "assets/images/news.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    CustomeWidgets.customeWidgets.heightSizeBox(number: 10),
                    Text(
                      'Registration',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    CustomeWidgets.customeWidgets.heightSizeBox(number: 10),
                    CustomeWidgets.customeWidgets.custom_textfield(
                        label_text: "Name",
                        hint_text: "Enter Name",
                        icon: Icon(Icons.person),
                        txt_controller: registrationController.reg_nametxt),
                    CustomeWidgets.customeWidgets.heightSizeBox(number: 10),
                    CustomeWidgets.customeWidgets.custom_textfield(
                        label_text: "Email Id",
                        hint_text: "Enter Email Id",
                        icon: Icon(Icons.email),
                        txt_controller: registrationController.reg_emailtxt),
                    CustomeWidgets.customeWidgets.heightSizeBox(number: 10),
                    CustomeWidgets.customeWidgets.custom_textfield_password(
                        label_text: "Password",
                        hint_text: "Enter Password",
                        icon: Icon(Icons.lock),
                        txt_controller: registrationController.reg_passwordtxt),
                    CustomeWidgets.customeWidgets.heightSizeBox(number: 10),
                    CustomeWidgets.customeWidgets.custom_textfield_password(
                        label_text: "Re Password",
                        hint_text: "Enter Re Password",
                        icon: Icon(Icons.lock),
                        txt_controller:
                            registrationController.reg_repasswordtxt),
                    CustomeWidgets.customeWidgets.heightSizeBox(number: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              if (registrationController
                                  .reg_nametxt.text.isEmpty) {
                                CustomeWidgets.customeWidgets
                                    .errorToast(msg: "Please Enter Name");
                              } else if (registrationController
                                  .reg_emailtxt.text.isEmpty) {
                                CustomeWidgets.customeWidgets
                                    .errorToast(msg: "Please Enter Email Id");
                              } else if (registrationController
                                  .reg_passwordtxt.text.isEmpty) {
                                CustomeWidgets.customeWidgets
                                    .errorToast(msg: "Please Enter Password");
                              } else if (registrationController
                                  .reg_repasswordtxt.text.isEmpty) {
                                CustomeWidgets.customeWidgets.errorToast(
                                    msg: "Please Enter Re Password");
                              } else if (registrationController
                                      .reg_emailtxt.text ==
                                  RegExp(
                                      r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)")) {
                                CustomeWidgets.customeWidgets
                                    .errorToast(msg: "Please Valid Password");
                              } else if (registrationController
                                      .reg_passwordtxt.text !=
                                  registrationController
                                      .reg_repasswordtxt.text) {
                                CustomeWidgets.customeWidgets.errorToast(
                                    msg:
                                        "Password And Repassword Are Not Same");
                              } else {
                                bool check = registrationController
                                    .emailValidate(registrationController
                                        .reg_emailtxt.text);
                                if (check == false) {
                                  CustomeWidgets.customeWidgets
                                      .errorToast(msg: "Please Valid Email");
                                } else {
                                  Shared_preference.shared_preference
                                      .registration(
                                          email: registrationController
                                              .reg_emailtxt.text,
                                          password: registrationController
                                              .reg_passwordtxt.text);
                                  Get.back();
                                }
                              }
                            },
                            child: Text("Registration")),
                        TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text("already created")),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
