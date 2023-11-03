import 'package:plant_app/data/app_state.dart';
import 'package:plant_app/models/plant_model.dart';
import 'package:plant_app/views/components/c_text.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Plant plant = ModalRoute.of(context)!.settings.arguments as Plant;

    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext ctx, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            return DetailMobile(plant: plant);
          } else {
            return DetailWeb(plant: plant);
          }
        },
      ),
    );
  }
}

class DetailWeb extends StatelessWidget {
  final Plant plant;
  const DetailWeb({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.withOpacity(0.7),
      body: Center(
        child: Card(
          child: SizedBox(
            width: 800,
            height: 500,
            child: SafeArea(
              child: Card(
                child: Container(
                  margin: const EdgeInsets.all(30),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                        ),
                        child: Image.asset(plant.imgAsset),
                      ),
                      Positioned(
                        left: 20,
                        top: 20,
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.black12,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            const SizedBox(width: 320),
                            // const FavoriteButton(),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 450,
                        top: 50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CText(text: plant.name, size: 20),
                            const SizedBox(height: 15),
                            // Row(
                            //   children: <Widget>[
                            //     const Icon(
                            //       Icons.star,
                            //       color: Colors.yellow,
                            //       size: 16,
                            //     ),
                            //     const SizedBox(height: 7),
                            //     CText(text: plants.rating),
                            //   ],
                            // ),
                            const SizedBox(height: 15),
                            // CText(
                            //   text: plants.price,
                            //   size: 17,
                            //   color: Colors.indigo,
                            // ),
                            const SizedBox(height: 15),
                            // Row(
                            //   children: [
                            //     const CText(
                            //       text: 'Size:   ',
                            //       weight: FontWeight.bold,
                            //       size: 16,
                            //     ),
                            //     CText(
                            //       text: plants.size,
                            //       color: Colors.teal.shade700,
                            //     ),
                            //   ],
                            // ),
                            const SizedBox(height: 20),
                            const CText(
                              text: 'Description',
                              weight: FontWeight.bold,
                              size: 20,
                            ),
                            const SizedBox(height: 15),
                            CText(
                              text: plant.desc,
                              color: Colors.grey,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 440,
                        top: 350,
                        child: Container(
                          height: 40,
                          width: 300,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green.shade900,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const CText(
                              text: 'Add to chart ',
                              size: 19,
                              weight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailMobile extends StatefulWidget {
  final Plant plant;

  const DetailMobile({Key? key, required this.plant}) : super(key: key);

  @override
  State<DetailMobile> createState() => _DetailMobileState();
}

class _DetailMobileState extends State<DetailMobile> {
  @override
  Widget build(BuildContext context) {
    bool isLike = widget.plant.isLike;

    Color color = Colors.grey.shade700;
    if (widget.plant.rare == 'a') {
      color = Colors.indigo;
    }
    if (widget.plant.rare == 'b') {
      color = Colors.deepOrange;
    }

    String rare = 'Common';
    if (widget.plant.rare == 'a') {
      rare = 'Special';
    }
    if (widget.plant.rare == 'b') {
      rare = 'Rare';
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(widget.plant.imgAsset),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black12,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        IconButton(
                          iconSize: 30,
                          icon: Icon(
                            isLike ? Icons.favorite : Icons.favorite_border,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              isLike = !isLike;
                              AppState().likeUnlike(widget.plant.id);
                              if (isLike) {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.black,
                                    duration: Duration(seconds: 1),
                                    content: CText(
                                      text: 'Adding to saved data',
                                      size: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              } else {
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
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CText(
                    text: widget.plant.name,
                    color: Colors.black,
                    size: 25,
                    letterSpacing: 0.8,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: <Widget>[
                      CText(
                        text: 'Rare: ',
                        size: 20,
                        weight: FontWeight.w400,
                        color: Colors.grey.shade600,
                        letterSpacing: 0.8,
                      ),
                      const SizedBox(height: 5),
                      CText(
                        text: rare,
                        size: 20,
                        color: color,
                        weight: FontWeight.w500,
                        letterSpacing: 1,
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  const CText(
                    text: 'Description',
                    weight: FontWeight.w500,
                    size: 20,
                  ),
                  const SizedBox(height: 5),
                  CText(
                    text: widget.plant.desc,
                    color: Colors.grey,
                    size: 20,
                    weight: FontWeight.w400,
                    letterSpacing: 1.2,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
