import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommere_user/controller/myfavorite_controller.dart';
import 'package:ecommere_user/core/constant/color.dart';
import 'package:ecommere_user/core/functions/translatefatabase.dart';
import 'package:ecommere_user/data/model/favoritemode.dart';
import 'package:ecommere_user/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

double randomRating = 3.5;

class CoustomMyFavorite extends GetView<MyFavoriteController> {
  final FavoriteModel itemsModel;
  // final bool active;
  const CoustomMyFavorite({super.key, required this.itemsModel});
  @override
  Widget build(BuildContext context) {
    randomRating += 0.5;
    return InkWell(
        onTap: () {
          // controller.goToPageProductDetails(itemsModel);
        },
        child: Card(
          child: Padding(
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
                      const Text("Rating ", textAlign: TextAlign.center),
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: 22,
                        child: Row(
                          children: List.generate(5, (index) {
                            if (index < randomRating.floor()) {
                              return const Icon(
                                Icons.star, // نجمة ممتلئة
                                size: 15,
                                color: Colors.amber,
                              );
                            } else if (index == randomRating.floor() &&
                                randomRating % 1 != 0) {
                              return const Icon(
                                Icons.star_half, // نصف نجمة
                                size: 15,
                                color: Colors.amber,
                              );
                            } else {
                              return const Icon(
                                Icons.star_border, // نجمة فارغة
                                size: 15,
                                color: Colors.grey,
                              );
                            }
                          }),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${itemsModel.itemsPrice} \$",
                          style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: "sans")),
                      IconButton(
                          onPressed: () {
                            controller
                                .deleteItems(itemsModel.favoriteId.toString());
                          },
                          icon: const Icon(
                            Icons.delete_outline_outlined,
                            color: AppColor.primaryColor,
                          ))
                    ],
                  )
                ]),
          ),
        ));
  }
}
