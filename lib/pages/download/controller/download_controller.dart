import 'package:demo50/utility/helpers/sql_database.dart';
import 'package:get/get.dart';

class DownloadController extends GetxController{
  RxList<Map> data = <Map>[].obs;
  RxInt changeIndex = 0.obs;

  void getData() async {
    data.value = await DbHelper.dbHelper.readData();
    update();
  }



  void index({required int index}) {
    changeIndex.value = index;
    update();
  }
}
