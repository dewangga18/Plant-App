import 'dart:io';

import 'package:plant_app/components/c_text.dart';
import 'package:plant_app/model/plant.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final Plant plants;
  
  const Detail({Key? key, required this.plants}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600&&
              (Platform.isAndroid || Platform.isIOS)) {
            return DetailMobile(plants: plants);
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
                        left: 20, top: 20,
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
                            const FavoriteButton(),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 450, top: 50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CText(text: plants.name, size: 20),
                            const SizedBox(height: 15),
                            Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 16,
                                ),
                                const SizedBox(height: 7),
                                CText(text: plants.rating),
                              ],
                            ),
                            const SizedBox(height: 15),
                            CText(
                              text: plants.price,
                              size: 17,
                              color: Colors.indigo
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                const Text(
                                  'Size:   ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                CText(
                                  text: plants.size,
                                  color: Colors.teal.shade700,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Description',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
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
                        left: 440, top: 350,
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
                            child: const Text(
                              'Add to chart ',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
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

class DetailMobile extends StatelessWidget {
  final Plant plants;
  const DetailMobile({
    Key? key,
    required this.plants,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(plants.imgAsset),
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
                        const FavoriteButton(),
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
                    text: plants.name,
                    color: Colors.black,
                    size: 18,
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 14,
                      ),
                      const SizedBox(height: 5),
                      CText(
                        text: plants.rating,
                        size: 14,
                      )
                    ],
                  ),
                  const SizedBox(height: 7),
                  CText(text: plants.price, size: 17, color: Colors.indigo),
                  const SizedBox(height: 7),
                  Row(
                    children: [
                      const Text('Size:   ',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      CText(
                        text: plants.size,
                        color: Colors.teal.shade700,
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  const Text(
                    'Description',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 7),
                  CText(
                    text: plants.desc,
                    color: Colors.grey,
                    size: 13,
                  ),
                  const SizedBox(height: 30),
                  Container(
                    height: 40,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade900,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Add to chart ',
                        style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                    ),
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

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          _isFavorite = !_isFavorite;
        });
      },
    );
  }
}
