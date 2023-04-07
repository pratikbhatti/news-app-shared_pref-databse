import 'package:demo50/pages/homePage/controller/home_controller.dart';
import 'package:demo50/pages/homePage/modal/home_modal.dart';
import 'package:demo50/pages/homePage/view/view_news_detail.dart';
import 'package:demo50/pages/loginPage/view/login_page.dart';
import 'package:demo50/utility/constant/color_style.dart';
import 'package:demo50/utility/constant/custome_widgets.dart';
import 'package:demo50/utility/helpers/api_calls.dart';
import 'package:demo50/utility/helpers/shared_preference.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(12),
                padding: EdgeInsets.all(6),
                child: InkWell(
                  onTap: () async {
                    Shared_preference.shared_preference
                        .changeLogin(value: true);
                    Get.off(LoginPage());
                  },
                  child: Container(
                    child: Text("Log Out"),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                // ignore: sort_child_properties_last
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: TextFormField(
                    controller: homeController.txtSearch,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: TextStyle(color: ColorStyle.greyShade400),
                      suffix: IconButton(
                        onPressed: () {
                          ApiCalls.apiCalls.newsApi(
                              name: "${homeController.txtSearch.text}");
                        },
                        icon: Icon(
                          Icons.search,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                ),
                height: MediaQuery.of(context).size.height / 17,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: ColorStyle.greyShade300),
              ),
            ),
            FutureBuilder(
              future: homeController.txtSearch.text.isEmpty
                  ? ApiCalls.apiCalls.newsApi(name: "india")
                  : ApiCalls.apiCalls
                      .newsApi(name: "${homeController.txtSearch.text}"),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text("Data Not Found"));
                } else if (snapshot.hasData) {
                  NewsApiModal? data = snapshot.data;
                  return
                    ListView.builder(
                    shrinkWrap: true,
                    itemCount: data!.articles!.length,
                    itemBuilder: (context, index) {
                      return
                        InkWell(
                        onTap: () {
                          homeController.index(index: index);
                          Get.to(ViewNewsDetails());
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
                                  "${data.articles![index].urlToImage}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  maxLines: 1,
                                  "${data.articles![index].title}",
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              subtitle: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      "${data.articles![index].author}")),
                              trailing: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_circle_right)),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}
