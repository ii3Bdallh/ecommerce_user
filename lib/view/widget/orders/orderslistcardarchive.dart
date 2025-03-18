import 'package:ecommere_user/controller/orders/archive_controller.dart';
import 'package:ecommere_user/core/constant/color.dart';
import 'package:ecommere_user/core/constant/routes.dart';
import 'package:ecommere_user/data/model/orders_model.dart';
import 'package:ecommere_user/view/widget/orders/ordersrating.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrderListArchvie extends GetView<ArchiveController> {
  final OrdersModel model;
  const CardOrderListArchvie({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Text(
                "Order Number  : ${model.ordersId} ",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              // Text()
              // From X
              Text(
                Jiffy.parse(model.ordersDatetime!).fromNow(),
                style: const TextStyle(
                    color: AppColor.primaryColor, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const Divider(),
          Text("Order Type : ${controller.printTypeOrder(model.ordersType!)}"),
          Text("Order Price :  ${model.ordersPrice}\$"),
          Text("Delivey price : ${model.ordersPricedelivery} \$"),
          Text(
              "Paymant Method :  ${controller.printPaymantMethod(model.ordersPaymantmethod!)}"),
          const Text("Status : Done"),
          const Divider(),
          Row(
            children: [
              Text(
                "Total Price :  ${model.ordersTotalprice}",
                style: const TextStyle(
                    color: AppColor.primaryColor, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              MaterialButton(
                onPressed: () {
                  Get.toNamed(AppRoute.ordersdetails,
                      arguments: {"ordersdetails": model});
                },
                color: AppColor.thirdColor,
                textColor: AppColor.secondColor,
                child: const Text("details"),
              ),
              const SizedBox(
                width: 10,
              ),
              if (model.ordersRating == "0")
                MaterialButton(
                  onPressed: () {
                    showDialogRating(context, model.ordersId!);
                  },
                  color: AppColor.thirdColor,
                  textColor: AppColor.secondColor,
                  child: const Text("Rating"),
                ),
            ],
          ),
        ]),
      ),
    );
  }
}
