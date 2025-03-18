import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommere_user/core/constant/color.dart';
import 'package:ecommere_user/linkapi.dart';
import 'package:flutter/material.dart';

class CoustomitemsCartList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imagename;
  final void Function()? add;
  final void Function()? remove;

  const CoustomitemsCartList(
      {super.key,
      required this.name,
      required this.price,
      required this.count,
      required this.imagename,
      required this.add,
      required this.remove});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: CachedNetworkImage(
                height: 100,
                fit: BoxFit.fill,
                imageUrl: '${AppLink.imagestItems}/$imagename',
              )),
          Expanded(
              flex: 3,
              child: ListTile(
                title: Text(
                  name,
                  style: const TextStyle(fontSize: 15),
                ),
                subtitle: Text(
                  "$price \$",
                  style: const TextStyle(
                      color: AppColor.primaryColor, fontSize: 16),
                ),
              )),
          Expanded(
              child: Column(
            children: [
              SizedBox(
                height: 40,
                child: IconButton(onPressed: add, icon: const Icon(Icons.add)),
              ),
              SizedBox(
                height: 30,
                child: Text(
                  count,
                  style: const TextStyle(fontFamily: "sans"),
                ),
              ),
              SizedBox(
                height: 30,
                child: IconButton(
                    onPressed: remove, icon: const Icon(Icons.remove)),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
