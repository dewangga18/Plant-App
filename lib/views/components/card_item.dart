import 'package:flutter/material.dart';
import 'package:plant_app/configs/routes/app_route.dart';
import 'package:plant_app/models/plant_model.dart';
import 'package:plant_app/views/components/c_text.dart';

class CardItem extends StatefulWidget {
  const CardItem({
    super.key,
    required this.item,
    this.isMobile = true,
    this.onlyTitle = false,
  });

  final Plant item;
  final bool isMobile;
  final bool onlyTitle;

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    Color color = Colors.grey.shade700;

    if (widget.item.rare == 'a') {
      color = Colors.indigo;
    }
    if (widget.item.rare == 'b') {
      color = Colors.deepOrange;
    }

    if (widget.isMobile) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRoute.detail,
            arguments: widget.item,
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
                  widget.item.imgAsset,
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
                    text: widget.item.name,
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
    } else {
      return InkResponse(
        onHover: (value) {
          setState(() => isHover = value);
        },
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRoute.detail,
            arguments: widget.item,
          );
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    image: AssetImage(
                      widget.item.imgAsset,
                    ),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.low,
                  ),
                ),
              ),
            ),
            if (isHover || widget.onlyTitle) ...[
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black38.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight,
                        colors: [
                        color.withOpacity(0.8),
                        color.withOpacity(0.11),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(15),
                    child: CText(
                      text: widget.item.name,
                      size: 20,
                      weight: FontWeight.bold,
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      );
    }
  }
}
