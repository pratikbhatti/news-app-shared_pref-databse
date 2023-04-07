import 'package:demo50/pages/download/controller/download_controller.dart';
import 'package:demo50/utility/constant/color_style.dart';
import 'package:demo50/utility/helpers/sql_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import 'view_download_page.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({super.key});

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  DownloadController downloadController = Get.put(DownloadController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    downloadController.getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Download"),
          centerTitle: true,
        ),
        body:
        Obx(()=>
        ListView.builder(
          itemCount: downloadController.data.length,
          itemBuilder: (context, index) {
            return
              InkWell(
                onTap: () {
                  downloadController.getData();
                  downloadController.index(index: index);
                  print(downloadController.data[index]['image']);
                  Get.to(ViewDownloadPage());

                  // homeController.index(index: index);
                  // Get.to(ViewNewsDetails());
                },
                child: Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8, left: 5, bottom: 8, right: 5),
                    child: ListTile(
                      leading: Container(
                        height:
                        MediaQuery.of(context).size.height / 1.5,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Image.network(
                          "${downloadController.data[index]['image']}",
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          maxLines: 1,
                          "${downloadController.data[index]['title']}",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      subtitle: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              "${downloadController.data[index]['author'] }"),),
                      trailing: IconButton(
                          onPressed: () {
                            DbHelper.dbHelper.deleteData(id: downloadController.data[index]['id']);
                            downloadController.getData();
                          },
                          icon: Icon(Icons.delete,color: ColorStyle.red,)),
                    ),
                  ),
                ),
              );

          },
        )),
      ),
    );
  }
}
