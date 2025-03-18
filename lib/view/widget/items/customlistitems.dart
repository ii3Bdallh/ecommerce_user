import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommere_user/controller/favorite_controller.dart';
import 'package:ecommere_user/controller/items_controller.dart';
import 'package:ecommere_user/core/constant/color.dart';
import 'package:ecommere_user/core/constant/imgaeasset.dart';
import 'package:ecommere_user/core/functions/translatefatabase.dart';
import 'package:ecommere_user/data/model/itemsmodel.dart';
import 'package:ecommere_user/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  // final bool active;
  const CustomListItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.goToPageProductDetails(itemsModel);
        },
        child: Card(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Hero(
                        tag: "${itemsModel.itemsId}",
                        child: CachedNetworkImage(
                          imageUrl:
                              "${AppLink.imagestItems}/${itemsModel.itemsImage!}",
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                          translateDatabase(
                              itemsModel.itemsNameAr, itemsModel.itemsName),
                          style: const TextStyle(
                              color: AppColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (itemsModel.itemsDiscount.toString() == "0.00")
                            Text("${itemsModel.itemsPrice} \$",
                                style: const TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "sans"))
                          else
                            Column(
                              children: [
                                Text("${itemsModel.itemsPrice} \$",
                                    style: const TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: AppColor.primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "sans")),
                                Text("${itemsModel.itemspricediscount} \$",
                                    style: const TextStyle(
                                        color: AppColor.primaryColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "sans")),
                              ],
                            ),
                          GetBuilder<FavoriteController>(
                              builder: (controller) => IconButton(
                                  onPressed: () {
                                    if (controller.isFavorite[
                                            itemsModel.itemsId.toString()] ==
                                        "1") {
                                      controller.setFavorite(
                                          itemsModel.itemsId.toString(), "0");
                                      controller.favoriteremove(
                                          itemsModel.itemsId.toString());
                                    } else {
                                      controller.setFavorite(
                                          itemsModel.itemsId.toString(), "1");
                                      controller.favoriteAdd(
                                          itemsModel.itemsId.toString());
                                    }
                                  },
                                  icon: Icon(
                                    controller.isFavorite[itemsModel.itemsId
                                                .toString()] ==
                                            "1"
                                        ? Icons.favorite
                                        : Icons.favorite_border_outlined,
                                    color: AppColor.primaryColor,
                                  )))
                        ],
                      )
                    ]),
              ),
              if (itemsModel.itemsDiscount != "0.00")
                Positioned(
                    top: 4,
                    left: 4,
                    child: Image.asset(
                      AppImageAsset.saleOne,
                      width: 40,
                    ))
            ],
          ),
        ));
  }
}


// logical thinking

  // GetBuilder<FavoriteController>(
  //                         builder: (controller) => IconButton(
  //                             onPressed: () {
  //                                 if (controller.isFavorite[itemsModel.itemsId] == "1" ) {
  //                                   controller.setFavorite(
  //                                       itemsModel.itemsId, "0");
  //                                 } else {
  //                                   controller.setFavorite(
  //                                       itemsModel.itemsId, "1");
  //                                 }
  //                             },
  //                             icon: Icon(
  //                               controller.isFavorite[itemsModel.itemsId] == "1"
  //                                   ? Icons.favorite
  //                                   : Icons.favorite_border_outlined,
  //                               color: AppColor.primaryColor,
  //                             )))