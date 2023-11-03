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

class DetailWeb extends StatefulWidget {
  final Plant plant;
  const DetailWeb({Key? key, required this.plant}) : super(key: key);

  @override
  State<DetailWeb> createState() => _DetailWebState();
}

class _DetailWebState extends State<DetailWeb> {
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
      body: Stack(
        children: [
          Image.asset(
            widget.plant.imgAsset,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.low,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned.fill(
            right: 0,
            left: 0,
            child: Container(
              color: Colors.black45,
            ),
          ),
          Center(
            child: SizedBox(
              width: 400,
              height: MediaQuery.of(context).size.height * 0.9,
              child: Card(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: <Widget>[
                          Image.asset(
                            widget.plant.imgAsset,
                            width: double.infinity,
                          ),
                          SafeArea(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.black26,
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
                                      isLike
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isLike = !isLike;
                                        AppState().likeUnlike(widget.plant.id);
                                        if (isLike) {
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
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
                                          ScaffoldMessenger.of(context)
                                              .clearSnackBars();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
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
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 5),
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
              ),
            ),
          ),
        ],
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
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black26,
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
