import 'package:ecommere_user/controller/cart_controller.dart';
import 'package:ecommere_user/core/class/handlingdataview.dart';
import 'package:ecommere_user/core/constant/routes.dart';
import 'package:ecommere_user/view/widget/cart/Coustombottomnavigationcart.dart';
import 'package:ecommere_user/view/widget/cart/itemcart.dart';
import 'package:ecommere_user/view/widget/cart/topcart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Get.offAllNamed(AppRoute.homepage);
              }),
          title: const Text(
            "My Cart",
          ),
        ),
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (controller) => BottomNavigationBarCart(
            price: cartController.pricetotal,
            discount: controller.coupondiscount,
            totalprice: controller.getTotalProce(),
            controllercoboun: controller.coboncontroller!,
            onApplayCobon: () {
              controller.checkCoupon();
            },
            shipping: 10,
          ),
        ),
        body: GetBuilder<CartController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    TopCart(
                        title:
                            "You Have ${controller.countitems} item in your list"),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          ...List.generate(
                            controller.data.length,
                            (i) => CoustomitemsCartList(
                              name: "${controller.data[i].itemsName}",
                              price: "${controller.data[i].itemspricetotal}",
                              count: "${controller.data[i].countitems}",
                              imagename: '${controller.data[i].itemsImage}',
                              add: () async {
                                await controller
                                    .cartAdd(controller.data[i].cartItemsid!);
                                controller.reFreshPage();
                              },
                              remove: () async {
                                await controller.cartRemove(
                                    controller.data[i].cartItemsid!);
                                controller.reFreshPage();
                              },
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ))));
  }
}
