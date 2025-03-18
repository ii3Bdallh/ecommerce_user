import 'package:ecommere_user/controller/orders/pinding_controller.dart';
import 'package:ecommere_user/core/class/handlingdataview.dart';
import 'package:ecommere_user/view/widget/orders/orderslistcardbinding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BendingOrders extends StatelessWidget {
  const BendingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BindingController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<BindingController>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return CardOrderList(
                        model: controller.data[index],
                      );
                    },
                  )))),
    );
  }
}
