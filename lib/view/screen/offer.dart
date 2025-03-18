import 'package:ecommere_user/controller/favorite_offer_controller.dart';
import 'package:ecommere_user/controller/offer_controller.dart';
import 'package:ecommere_user/core/class/handlingdataview.dart';
import 'package:ecommere_user/core/constant/routes.dart';
import 'package:ecommere_user/view/screen/home.dart';
import 'package:ecommere_user/view/widget/customappbar.dart';
import 'package:ecommere_user/view/widget/offercoustom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    OfferController controller = Get.put(OfferController());
    FavoriteOfferController favoriteController =
        Get.put(FavoriteOfferController());
    controller.refrechData();

    return GetBuilder<OfferController>(builder: (controller) {
      return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(15),
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
                controller.isSearrch == false
                    ? ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.data.length,
                        itemBuilder: ((context, index) {
                          favoriteController.isFavorite[
                                  controller.data[index].itemsId] =
                              controller.data[index].favorite;
                          return InkWell(
                            child: CustomListItemsOffer(
                                itemsModel: controller.data[index]),
                          );
                        }))
                    : ListItemSearch(listdataSearch: controller.listdata)
              ],
            ),
          ));
    });
  }
}
