import 'package:demo50/pages/download/controller/download_controller.dart';
import 'package:demo50/pages/download/view/download_page.dart';
import 'package:demo50/pages/homePage/controller/home_controller.dart';
import 'package:demo50/pages/homePage/modal/home_modal.dart';
import 'package:demo50/utility/constant/color_style.dart';
import 'package:demo50/utility/helpers/api_calls.dart';
import 'package:demo50/utility/helpers/sql_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewNewsDetails extends StatefulWidget {
  const ViewNewsDetails({super.key});

  @override
  State<ViewNewsDetails> createState() => _ViewNewsDetailsState();
}

class _ViewNewsDetailsState extends State<ViewNewsDetails> {
  HomeController homeController = Get.put(HomeController());
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
          title: Text("News"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: FutureBuilder(
            future: ApiCalls.apiCalls.newsApi(name: "india"),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text("Data Not Found"));
              } else if (snapshot.hasData) {
                NewsApiModal? data = snapshot.data;
                return

                  Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        "${data!.articles![homeController.changeIndex.value].urlToImage}",
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    child: Text(
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                      "${data.articles![homeController.changeIndex.value].title}",
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    child: Text(
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                      "${data.articles![homeController.changeIndex.value].description}",
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    "${data.articles![homeController.changeIndex.value].publishedAt}",
                                  ),
                                ),
                              ],
                            ),
                            DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    "Content",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    child: Text(
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                      "${data.articles![homeController.changeIndex.value].content}",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        final url = Uri.parse(
                            '${data.articles![homeController.changeIndex.value].url}');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(
                            url,
                          );
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Text("Read more.."),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          DbHelper.dbHelper.insertData(
                              title:
                                  "${data.articles![homeController.changeIndex.value].title}",
                              description:
                                  "${data.articles![homeController.changeIndex.value].description}",
                              publish:
                                  "${data.articles![homeController.changeIndex.value].publishedAt}",
                              content:
                                  "${data.articles![homeController.changeIndex.value].content}",
                              image:
                                  "${data.articles![homeController.changeIndex.value].urlToImage}",
                              author:
                                  "${data.articles![homeController.changeIndex.value].author}");
                          downloadController.getData();
                          Get.to(DownloadPage());
                        },
                        child: Text(
                          "Download",
                          style: TextStyle(color: ColorStyle.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorStyle.red, // Background color
                        ),
                      ),
                    )
                  ],
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
