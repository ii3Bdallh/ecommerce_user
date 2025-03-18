// ignore: file_names
import 'package:ecommere_user/controller/cart_controller.dart';
import 'package:ecommere_user/core/constant/color.dart';
import 'package:ecommere_user/view/widget/cart/coubonbuttom.dart';
import 'package:ecommere_user/view/widget/cart/coustombuttoncart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationBarCart extends GetView<CartController> {
  final TextEditingController controllercoboun;
  final double price;
  final double discount;
  final double shipping;
  final double totalprice;
  final void Function()? onApplayCobon;

  const BottomNavigationBarCart(
      {super.key,
      required this.price,
      required this.discount,
      required this.totalprice,
      required this.controllercoboun,
      required this.onApplayCobon,
      required this.shipping});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GetBuilder<CartController>(builder: (controller) {
              return controller.couponname == null
                  ? Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: controllercoboun,
                            decoration: InputDecoration(
                                hintText: "Coboun Code",
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 10),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            flex: 1,
                            child: CustomButtomCoubon(
                                textbutton: "apply", onPressed: onApplayCobon)),
                      ],
                    )
                  : Text(
                      "Coupon Code ${controller.couponname}",
                      style: const TextStyle(
                          color: AppColor.primaryColor, fontSize: 20),
                    );
            })),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.primaryColor, width: 1),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child:
                          const Text("price", style: TextStyle(fontSize: 16))),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("$price \$",
                          style: const TextStyle(fontSize: 16)))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text("Discount",
                          style: TextStyle(fontSize: 16))),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("$discount %",
                          style: const TextStyle(fontSize: 16)))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text("Shipping",
                          style: TextStyle(fontSize: 16))),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("$shipping \$",
                          style: const TextStyle(fontSize: 16)))
                ],
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 19),
                  child: Divider(
                    color: Colors.black,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Text("Total price",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold))),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("$totalprice \$",
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)))
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomButtonCart(
          textbutton: "Plz Order",
          onPressed: () {
            controller.goToPageCheckOut();
          },
        )
      ],
    );
  }
}
