import 'package:flutter/material.dart';
import 'package:plant_app/data/app_state.dart';
import 'package:plant_app/models/plant_model.dart';
import 'package:plant_app/views/components/c_text.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600) {
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
    List<Plant> plants = AppState().plantList;

    if (plants.isEmpty) {
      return Container();
    }

    return Scaffold(
      body: ListView.builder(
        itemCount: plants.where((item) => item.isLike).length,
        itemBuilder: (_, i) {
          var item = plants.where((data) => data.isLike).elementAt(i);

          return CText(text: item.name);
        },
      ),
    );
  }
}

class SavedWeb extends StatelessWidget {
  const SavedWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
