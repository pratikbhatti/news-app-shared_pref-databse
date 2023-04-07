import 'package:demo50/pages/homePage/view/home_page.dart';
import 'package:demo50/pages/loginPage/controller/login_controller.dart';
import 'package:demo50/pages/registrationPage/view/registration_page.dart';
import 'package:demo50/utility/constant/custome_widgets.dart';
import 'package:demo50/utility/helpers/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController loginController = Get.put(LoginController());
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
                ),
              ),
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
                      'Login',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    CustomeWidgets.customeWidgets.heightSizeBox(number: 10),
                    CustomeWidgets.customeWidgets.custom_textfield(
                        label_text: "Email Id",
                        hint_text: "Enter Email Id",
                        icon: Icon(Icons.email),
                        txt_controller: loginController.loginEmailtxt),
                    CustomeWidgets.customeWidgets.heightSizeBox(number: 10),
                    CustomeWidgets.customeWidgets.custom_textfield_password(
                        label_text: "Password",
                        hint_text: "Enter Password Id",
                        icon: Icon(Icons.lock),
                        txt_controller: loginController.loginPasswordtxt),
                    CustomeWidgets.customeWidgets.heightSizeBox(number: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              String? read_email = await Shared_preference
                                  .shared_preference
                                  .readEmail();
                              String? read_password = await Shared_preference
                                  .shared_preference
                                  .readPassword();
                              if (loginController.loginEmailtxt.text.isEmpty) {
                                CustomeWidgets.customeWidgets
                                    .errorToast(msg: "Please Enter Email");
                              } else if (loginController
                                  .loginPasswordtxt.text.isEmpty) {
                                CustomeWidgets.customeWidgets
                                    .errorToast(msg: "Please Enter Password");
                              } else if (loginController.loginEmailtxt.text !=
                                  read_email) {
                                CustomeWidgets.customeWidgets.errorToast(
                                    msg: "Please Enter Valid Email");
                              } else if (loginController
                                      .loginPasswordtxt.text !=
                                  read_password) {
                                CustomeWidgets.customeWidgets.errorToast(
                                    msg: "Please Enter Valid Password");
                              } else {
                                Shared_preference.shared_preference.login();
                                // final SharedPreferences prefs =
                                //     await SharedPreferences.getInstance();
                                // prefs.setBool('login', false);
                                Shared_preference.shared_preference
                                    .changeLogin(value: false);
                                // bool? a = await Shared_preference
                                //     .shared_preference
                                //     .readLogin();
                                // print(a);
                                Get.off(HomePage());
                              }
                            },
                            child: Text("Login")),
                        TextButton(
                            onPressed: () {
                              Get.to(RegistrationPage());
                            },
                            child: Text("Create New Account")),
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
