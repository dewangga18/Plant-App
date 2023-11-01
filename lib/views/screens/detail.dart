import 'package:plant_app/data/app_state.dart';
import 'package:plant_app/models/plant_model.dart';
import 'package:plant_app/views/components/c_text.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map;
    Plant plants = data["data"] as Plant;
    int i = data["i"] as int;

    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            return DetailMobile(plants: plants, i: i);
          } else {
            return DetailWeb(plants: plants);
          }
        },
      ),
    );
  }
}

class DetailWeb extends StatelessWidget {
  final Plant plants;
  const DetailWeb({Key? key, required this.plants}) : super(key: key);

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
                        child: Image.asset(plants.imgAsset),
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
                            CText(text: plants.name, size: 20),
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
                              text: plants.desc,
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
  final Plant plants;
  final int i;

  const DetailMobile({
    Key? key,
    required this.plants,
    required this.i,
  }) : super(key: key);

  @override
  State<DetailMobile> createState() => _DetailMobileState();
}

class _DetailMobileState extends State<DetailMobile> {
  @override
  Widget build(BuildContext context) {
    bool isLike = widget.plants.isLike;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(widget.plants.imgAsset),
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
                          icon: Icon(
                            isLike ? Icons.favorite : Icons.favorite_border,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              isLike = !isLike;
                              AppState().likeDislike(widget.i);
                              if (isLike) {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.black,
                                    duration: Duration(seconds: 2),
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
                                    duration: Duration(seconds: 2),
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
                        )
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
                    text: widget.plants.name,
                    color: Colors.black,
                    size: 18,
                  ),
                  // Row(
                  //   children: <Widget>[
                  //     const Icon(
                  //       Icons.star,
                  //       color: Colors.yellow,
                  //       size: 14,
                  //     ),
                  //     const SizedBox(height: 5),
                  //     CText(
                  //       text: widget.plants.rating,
                  //       size: 14,
                  //     )
                  //   ],
                  // ),
                  const SizedBox(height: 7),
                  // CText(
                  //   text: widget.plants.price,
                  //   size: 17,
                  //   color: Colors.indigo,
                  // ),
                  const SizedBox(height: 7),
                  // Row(
                  //   children: [
                  //     const CText(
                  //       text: 'Size:   ',
                  //       weight: FontWeight.bold,
                  //       size: 16,
                  //     ),
                  //     CText(
                  //       text: widget.plants.size,
                  //       color: Colors.teal.shade700,
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: 7),
                  const CText(
                    text: 'Description',
                    weight: FontWeight.bold,
                    size: 20,
                  ),
                  const SizedBox(height: 7),
                  CText(
                    text: widget.plants.desc,
                    color: Colors.grey,
                    size: 13,
                  ),
                  const SizedBox(height: 30),
                  // Container(
                  //   height: 40,
                  //   width: double.infinity,
                  //   padding: const EdgeInsets.symmetric(horizontal: 10),
                  //   child: ElevatedButton(
                  //     onPressed: () {},
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: Colors.green.shade900,
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(10),
                  //       ),
                  //     ),
                  //     child: const CText(
                  //       text: 'Add to chart ',
                  //       size: 19,
                  //       weight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
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
