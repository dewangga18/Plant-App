import 'package:flutter/material.dart';
import 'package:plant_app/configs/routes/app_route.dart';
import 'package:plant_app/models/plant_model.dart';
import 'package:plant_app/views/components/c_text.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.item,
    required this.i,
  });

  final Plant item;
  final int i;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoute.detail,
          arguments: {
            'data': item,
            'i': i,
          },
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.asset(
                item.imgAsset,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.low,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 10,
              ),
              child: CText(
                text: item.name,
                size: 16.0,
                weight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
