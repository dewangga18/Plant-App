import 'dart:io';

import 'package:flutter/material.dart';
import 'package:plant_app/data/data_item.dart';

class SavedScreen extends StatelessWidget {
  final DataItem item;
  
  const SavedScreen({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600 &&
            (Platform.isAndroid || Platform.isIOS)) {
          return const SavedMobile();
        } else {
          return const SavedWeb();
        }
      },
    );
  }
}

class SavedMobile extends StatelessWidget {
  const SavedMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class SavedWeb extends StatelessWidget {
  const SavedWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
