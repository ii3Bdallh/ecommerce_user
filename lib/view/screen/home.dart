import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommere_user/controller/home_controller.dart';
import 'package:ecommere_user/core/class/handlingdataview.dart';
import 'package:ecommere_user/core/constant/routes.dart';
import 'package:ecommere_user/data/model/itemsmodel.dart';
import 'package:ecommere_user/linkapi.dart';
import 'package:ecommere_user/view/widget/customappbar.dart';
import 'package:ecommere_user/view/widget/home/customcardhome.dart';
import 'package:ecommere_user/view/widget/home/customtitlehome.dart';
import 'package:ecommere_user/view/widget/home/listcategorieshome.dart';
import 'package:ecommere_user/view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                CustomAppBar(
                  titleappbar: "Find Product",
                  onPressedIcon: () {
                    Get.toNamed(AppRoute.myFavorite);
                  },
                  onPressedSearch: () {
                    controller.onSearch();
                  },
                  onChanged: (String val) {
                    controller.checkSearch(val);
                  },
                  mycontroller: controller.search,
                ),
                HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: controller.isSearrch == false
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomCardHome(
                                  title: "${controller.titlehometext}",
                                  body: "${controller.bodyhometext}"),
                              const CustomTitleHome(title: "Categories"),
                              const ListCategoriesHome(),
                              const CustomTitleHome(title: "Top Selling"),
                              const ListItemsHome(),
                              const CustomTitleHome(title: "Top Popular"),
                              const ListItemsHome(),
                            ],
                          )
                        : ListItemSearch(listdataSearch: controller.listdata))
              ],
            )));
  }
}

class ListItemSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdataSearch;
  const ListItemSearch({super.key, required this.listdataSearch});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listdataSearch.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToPageProductDetails(listdataSearch[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                          child: CachedNetworkImage(
                        imageUrl:
                            "${AppLink.imagestItems}/${listdataSearch[index].itemsImage!}",
                        height: 100,
                        fit: BoxFit.fill,
                      )),
                      Expanded(
                          flex: 2,
                          child: ListTile(
                            title: Text(listdataSearch[index].itemsName!),
                            subtitle:
                                Text(listdataSearch[index].categoriesName!),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
