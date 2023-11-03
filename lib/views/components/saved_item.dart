import 'package:flutter/material.dart';
import 'package:plant_app/models/plant_model.dart';
import 'package:plant_app/views/components/c_text.dart';

class SavedItem extends StatefulWidget {
  const SavedItem({
    super.key,
    required this.item,
    required this.i,
    required this.onTap,
    this.isMobile = true,
  });

  final Plant item;
  final int i;
  final bool isMobile;
  final Function() onTap;

  @override
  State<SavedItem> createState() => _SavedItemState();
}

class _SavedItemState extends State<SavedItem> {
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
      return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              color.withOpacity(0.11),
              color.withOpacity(0.3),
            ],
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  widget.item.imgAsset,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.low,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CText(
                    text: widget.item.name,
                    size: 20,
                    weight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  CText(
                    text: widget.item.desc,
                    size: 14,
                    weight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              iconSize: 30,
              icon: Icon(
                widget.item.isLike ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: widget.onTap,
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              color.withOpacity(0.11),
              color.withOpacity(0.3),
            ],
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 140,
              width: 140,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  widget.item.imgAsset,
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.low,
                ),
              ),
            ),
            const SizedBox(width: 25),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CText(
                    text: widget.item.name,
                    size: 30,
                    weight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  CText(
                    text: widget.item.desc,
                    size: 20,
                    weight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 25),
            IconButton(
              iconSize: 35,
              icon: Icon(
                widget.item.isLike ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: widget.onTap,
            ),
          ],
        ),
      );
    }
  }
}
