import 'package:ecommere_user/controller/checkout_controller.dart';
import 'package:ecommere_user/core/class/handlingdataview.dart';
import 'package:ecommere_user/core/constant/color.dart';
import 'package:ecommere_user/core/constant/imgaeasset.dart';
import 'package:ecommere_user/core/constant/routes.dart';
import 'package:ecommere_user/view/widget/CheckOut/CardDeliverytype.dart';
import 'package:ecommere_user/view/widget/CheckOut/CheckoutAddress.dart';
import 'package:ecommere_user/view/widget/CheckOut/choose.dart';
import 'package:ecommere_user/view/widget/CheckOut/methoods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CheckOutCOntroller cOntroller = Get.put(CheckOutCOntroller());
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: MaterialButton(
          color: AppColor.primaryColor,
          textColor: Colors.white,
          onPressed: () {
            cOntroller.addCheckOut();
          },
          child: const Text(
            "CheckOut",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("CheckOut"),
      ),
      body: GetBuilder<CheckOutCOntroller>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(15),
              child: ListView(
                children: [
                  const CheckOutChoose(title: "Choose Paymant Method"),
                  InkWell(
                      onTap: () {
                        controller.choosePaymant("0");
                      },
                      child: MethodsOfPaymant(
                          name: "Cashe",
                          isactive:
                              controller.paymantmethod == "0" ? true : false)),
                  InkWell(
                      onTap: () {
                        controller.choosePaymant("1");
                      },
                      child: MethodsOfPaymant(
                          name: "Payments Cards",
                          isactive:
                              controller.paymantmethod == "1" ? true : false)),
                  const SizedBox(
                    height: 20,
                  ),
                  const CheckOutChoose(title: "Choose Delivery Type"),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          controller.chooseDelivary("0");
                        },
                        child: CardDeliveryTyoe(
                            imagename: AppImageAsset.deliveryImage,
                            title: "Delivery",
                            isactive:
                                controller.delivertype == "0" ? true : false),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          controller.chooseDelivary("1");
                        },
                        child: CardDeliveryTyoe(
                            imagename: AppImageAsset.drivethruImage,
                            title: "Recive",
                            isactive:
                                controller.delivertype == "1" ? true : false),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (controller.data.isEmpty && controller.delivertype == "0")
                    Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(AppRoute.addressadd);
                            },
                            child: const Text(
                              "You Don't Have An Address \n Click Here To Add One",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: AppColor.secondColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (controller.delivertype == "0" &&
                      controller.data.isNotEmpty)
                    Column(
                      children: [
                        const CheckOutChoose(title: "Shipping Address"),
                        const SizedBox(
                          height: 10,
                        ),
                        ...List.generate(
                          controller.data.length,
                          (index) => InkWell(
                            onTap: () {
                              controller.chooseAddress(
                                  controller.data[index].addressId!);
                            },
                            child: CheckOutAddress(
                                title: "${controller.data[index].addressName}",
                                body:
                                    "${controller.data[index].addressCity} ,${controller.data[index].addressStreet}",
                                isacive: controller.shippingaddress ==
                                        controller.data[index].addressId!
                                    ? true
                                    : false),
                          ),
                        )
                      ],
                    )
                ],
              ),
            )),
      ),
    );
  }
}
