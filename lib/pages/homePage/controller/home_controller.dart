import 'package:demo50/utility/helpers/sql_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController txtSearch = TextEditingController();
  RxInt changeIndex = 0.obs;

  void index({required int index}) {
    changeIndex.value = index;
    update();
  }

}
