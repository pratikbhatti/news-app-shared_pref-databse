import 'package:demo50/pages/download/controller/download_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewDownloadPage extends StatefulWidget {
  const ViewDownloadPage({Key? key}) : super(key: key);

  @override
  State<ViewDownloadPage> createState() => _ViewDownloadPageState();
}

class _ViewDownloadPageState extends State<ViewDownloadPage> {
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
        body:   SingleChildScrollView(
          child:
          Obx(()=>
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  "${downloadController.data[downloadController.changeIndex.value]['image']}",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: DataTable(
                    dataRowHeight: 90,
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text('Name'),
                      ),
                      DataColumn(
                        label: Text('Description'),
                        numeric: true,
                      ),
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          DataCell(
                            Text(
                              "Title",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataCell(
                            Container(
                              height: MediaQuery.of(context).size.height / 3,
                              child: Text(
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                "${downloadController.data[downloadController.changeIndex.value]['title']}",
                              ),
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            Text(
                              "Description",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataCell(
                            Container(
                              height: MediaQuery.of(context).size.height / 3,
                              child: Text(
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                "${downloadController.data[downloadController.changeIndex.value]['description']}",
                              ),
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            Text(
                              "Publish",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataCell(
                            Text(
                              "${downloadController.data[downloadController.changeIndex.value]['publish']}",
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            Text(
                              "Content",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataCell(
                            Container(
                              height: MediaQuery.of(context).size.height / 3,
                              child: Text(
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                "${downloadController.data[downloadController.changeIndex.value]['content']}",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );

  }
}
