import 'package:flutter/material.dart';
import 'package:plant_app/data/app_state.dart';
import 'package:plant_app/models/plant_model.dart';
import 'package:plant_app/views/components/c_text.dart';
import 'package:plant_app/views/components/saved_item.dart';

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

class SavedMobile extends StatefulWidget {
  const SavedMobile({Key? key}) : super(key: key);

  @override
  State<SavedMobile> createState() => _SavedMobileState();
}

class _SavedMobileState extends State<SavedMobile> {
  List<Plant> plants = AppState().plantList;

  @override
  Widget build(BuildContext context) {
    bool isEmpty = true;

    for (var item in plants) {
      if (item.isLike) {
        isEmpty = false;
        break;
      }
    }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                const CText(
                  text: 'Saved Place for',
                  size: 15,
                  weight: FontWeight.w500,
                ),
                CText(
                  text: 'Favourite Plants',
                  size: 25,
                  color: Colors.green.shade700,
                  weight: FontWeight.bold,
                ),
              ],
            ),
          ),
          if (isEmpty) ...[
            SizedBox(height: MediaQuery.of(context).size.height / 2.6),
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CText(
                    text: 'Ooppss is still empty',
                    size: 24,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(height: 2),
                  CText(
                    text: 'Save your favourite plants in here!',
                    size: 17,
                    letterSpacing: 1.2,
                  ),
                ],
              ),
            ),
          ],
          Expanded(
            child: ListView.separated(
              separatorBuilder: (_, i) => const SizedBox(height: 15),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              itemCount: plants.where((item) => item.isLike).length,
              itemBuilder: (_, i) {
                var item = plants.where((data) => data.isLike).elementAt(i);

                return SavedItem(
                  item: item,
                  i: i,
                  onTap: () {
                    setState(() {
                      AppState().likeUnlike(item.id);
                      plants = AppState().plantList;
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.black,
                          duration: Duration(seconds: 1),
                          content: CText(
                            text: 'Remove to saved data',
                            size: 12,
                            color: Colors.white,
                          ),
                        ),
                      );
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SavedWeb extends StatefulWidget {
  const SavedWeb({Key? key}) : super(key: key);

  @override
  State<SavedWeb> createState() => _SavedWebState();
}

class _SavedWebState extends State<SavedWeb> {
  @override
  Widget build(BuildContext context) {
    bool isEmpty = true;

    for (var item in plants) {
      if (item.isLike) {
        isEmpty = false;
        break;
      }
    }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                const CText(
                  text: 'Saved Place for',
                  size: 15,
                  weight: FontWeight.w500,
                ),
                CText(
                  text: 'Favourite Plants',
                  size: 25,
                  color: Colors.green.shade700,
                  weight: FontWeight.bold,
                ),
              ],
            ),
          ),
          if (isEmpty) ...[
            SizedBox(height: MediaQuery.of(context).size.height / 2.6),
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CText(
                    text: 'Ooppss is still empty',
                    size: 24,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(height: 2),
                  CText(
                    text: 'Save your favourite plants in here!',
                    size: 17,
                    letterSpacing: 1.2,
                  ),
                ],
              ),
            ),
          ],
          Expanded(
            child: ListView.separated(
              separatorBuilder: (_, i) => const SizedBox(height: 15),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              itemCount: plants.where((item) => item.isLike).length,
              itemBuilder: (_, i) {
                var item = plants.where((data) => data.isLike).elementAt(i);

                return SavedItem(
                  item: item,
                  i: i,
                  isMobile: false,
                  onTap: () {
                    setState(() {
                      AppState().likeUnlike(item.id);
                      plants = AppState().plantList;
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.black,
                          duration: Duration(seconds: 1),
                          content: CText(
                            text: 'Remove to saved data',
                            size: 12,
                            color: Colors.white,
                          ),
                        ),
                      );
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
