import 'package:ecommere_user/controller/address/view_address_controller.dart';
import 'package:ecommere_user/core/class/handlingdataview.dart';
import 'package:ecommere_user/core/constant/routes.dart';
import 'package:ecommere_user/data/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewwAddress extends StatelessWidget {
  const ViewwAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewAddressCOntroller());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.addressadd);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: const Text("Address"),
      ),
      body: GetBuilder<ViewAddressCOntroller>(
        builder: (controller) {
          return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardAddress(
                    addressModel: controller.data[index],
                    ondelete: () {
                      controller.deletedata(controller.data[index].addressId!);
                    },
                    ontap: () {},
                  );
                },
              ));
        },
      ),
    );
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? ondelete;
  final void Function()? ontap;
  const CardAddress(
      {super.key,
      required this.addressModel,
      required this.ondelete,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            title: Text(addressModel.addressName!),
            subtitle: Text(
                "${addressModel.addressCity!}\n${addressModel.addressStreet!} , ${addressModel.addressHome}"),
            trailing: IconButton(
              onPressed: ondelete,
              icon: const Icon(Icons.delete_forever_outlined),
            ),
          ),
        ),
      ),
    );
  }
}
