import 'package:ecommere_user/controller/myfavorite_controller.dart';
import 'package:ecommere_user/core/class/handlingdataview.dart';
import 'package:ecommere_user/view/widget/favorite/favoritelist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(children: [
          // CustomAppBar(
          //     titleappbar: "Find Product",
          //     onPressedIcon: () {},
          //     onPressedSearch: () {}),
          const SizedBox(height: 20),
          GetBuilder<MyFavoriteController>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.7),
                      itemBuilder: (BuildContext context, index) {
                        return CoustomMyFavorite(
                            itemsModel: controller.data[index]);
                      })))
        ]),
      ),
    );
  }
}
