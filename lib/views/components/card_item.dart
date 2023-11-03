import 'package:flutter/material.dart';
import 'package:plant_app/configs/routes/app_route.dart';
import 'package:plant_app/models/plant_model.dart';
import 'package:plant_app/views/components/c_text.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.item});

  final Plant item;

  @override
  Widget build(BuildContext context) {
    Color color = Colors.grey.shade700;

    if (item.rare == 'a') {
      color = Colors.indigo;
    }
    if (item.rare == 'b') {
      color = Colors.deepOrange;
    }

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoute.detail,
          arguments: item,
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
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                    colors: [
                      color.withOpacity(0.11),
                      color.withOpacity(0.3),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(10),
                child: CText(
                  text: item.name,
                  size: 14.0,
                  weight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
