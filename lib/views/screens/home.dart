import 'dart:io';

import 'package:flutter/material.dart';
import 'package:plant_app/data/data_item.dart';
import 'package:plant_app/models/plant_model.dart';
import 'package:plant_app/views/components/c_text.dart';
import 'package:plant_app/views/components/choose_menu_button.dart';

class HomeScreen extends StatelessWidget {
  final DataItem item;

  const HomeScreen({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600 &&
            (Platform.isAndroid || Platform.isIOS)) {
          return HomeMobile(item: item);
        } else {
          return HomeWeb(item: item);
        }
      },
    );
  }
}

class HomeMobile extends StatefulWidget {
  final DataItem item;
  const HomeMobile({Key? key, required this.item}) : super(key: key);

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  List<String> pages = ['All', 'Aloevera', 'Monstera', 'Cactus'];
  int index = 0;
  List<Plant> listHome = plants;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const CText(text: 'Hello', size: 18),
            CText(
              text: 'Plant Lovers!',
              size: 24,
              color: Colors.green.shade700,
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      itemCount: pages.length,
                      itemBuilder: (_, i) {
                        return ChooseMenuButton(
                          text: pages[i],
                          index: i,
                          isActive: i == index,
                          onTap: () {
                            setState(() {
                              index = i;
                              if (i == 0) {
                                listHome = plants;
                              } else if (i == 1) {
                                listHome.clear();
                                for (var item in plants) {
                                  if (item.type == 'aloevera') {
                                    listHome.add(item);
                                  }
                                }
                              } else if (i == 2) {listHome.clear();
                                for (var item in plants) {
                                  if (item.type == 'monstera') {
                                    listHome.add(item);
                                  }
                                }
                              } else if (i == 3) {listHome.clear();
                                for (var item in plants) {
                                  if (item.type == 'cactus') {
                                    listHome.add(item);
                                  }
                                }
                              }
                            });
                          },
                        );
                      },
                      separatorBuilder: (_, i) => const SizedBox(width: 10),
                    ),
                  ),
                  const SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.green.shade800),
                      ),
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      minimumSize: const Size(30, 35),
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: Colors.green.shade800,
                    ),
                  ),
                ],
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: listHome.length,
              itemBuilder: (_, i) {
                return Text(listHome[i].name);
              },
            ),
            // GridView.count(
            //   shrinkWrap: true,
            //   crossAxisCount: 2,
            //   crossAxisSpacing: 16,
            //   mainAxisSpacing: 16,
            //   physics: const AlwaysScrollableScrollPhysics(),
            //   children: listHome.map((av) {
            //     return CText(text: av.name);
            //     // return InkWell(
            //     //   onTap: () {
            //     //     // Navigator.push(
            //     //     //   context,
            //     //     //   MaterialPageRoute(builder: (context) {
            //     //     //     return DetailMobile(plants: av);
            //     //     //   }),
            //     //     // );
            //     //   },
            //     //   child: Card(
            //     //     child: Column(
            //     //       crossAxisAlignment: CrossAxisAlignment.stretch,
            //     //       children: [
            //     //         Expanded(
            //     //           child: Image.asset(
            //     //             av.imgAsset,
            //     //             fit: BoxFit.cover,
            //     //           ),
            //     //         ),
            //     //         const SizedBox(height: 8),
            //     //         Padding(
            //     //           padding: const EdgeInsets.only(left: 8.0),
            //     //           child: CText(
            //     //             text: av.name,
            //     //             size: 16.0,
            //     //             weight: FontWeight.bold,
            //     //           ),
            //     //         ),
            //     //         Padding(
            //     //           padding: const EdgeInsets.only(
            //     //             left: 8.0,
            //     //             bottom: 8.0,
            //     //           ),
            //     //           child: Text(av.rating),
            //     //         ),
            //     //       ],
            //     //     ),
            //     //   ),
            //     // );
            //   }).toList(),
            // ),
            // Container(
            //   margin: const EdgeInsets.only(left: 15),
            //   child: Align(
            //     alignment: Alignment.centerLeft,
            //     child: TabBar(
            //       labelColor: Colors.green,
            //       controller: controller,
            //       tabs: const [
            //         Tab(text: 'Aloevera'),
            //         Tab(text: 'Cactus'),
            //         Tab(text: 'Monstera'),
            //       ],
            //     ),
            //   ),
            // ),
            // Container(
            //   height: 500,
            //   width: double.infinity,
            //   padding: const EdgeInsets.only(left: 20, right: 20),
            //   child: TabBarView(
            //     controller: controller,
            //     children: [
            //
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: GridView.count(
            //           crossAxisCount: 2,
            //           crossAxisSpacing: 16,
            //           mainAxisSpacing: 16,
            //           children: cactus.map((av) {
            //             return InkWell(
            //               onTap: () {
            //                 Navigator.push(
            //                   context,
            //                   MaterialPageRoute(builder: (context) {
            //                     return DetailMobile(plants: av);
            //                   }),
            //                 );
            //               },
            //               child: Card(
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.stretch,
            //                   children: [
            //                     Expanded(
            //                       child: Image.asset(
            //                         av.imgAsset,
            //                         fit: BoxFit.cover,
            //                       ),
            //                     ),
            //                     const SizedBox(height: 8),
            //                     Padding(
            //                       padding: const EdgeInsets.only(left: 8.0),
            //                       child: Text(
            //                         av.name,
            //                         style: const TextStyle(
            //                           fontSize: 16.0,
            //                           fontWeight: FontWeight.bold,
            //                         ),
            //                       ),
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.only(
            //                         left: 8.0,
            //                         bottom: 8.0,
            //                       ),
            //                       child: Text(
            //                         av.rating,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             );
            //           }).toList(),
            //         ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: GridView.count(
            //           crossAxisCount: 2,
            //           crossAxisSpacing: 16,
            //           mainAxisSpacing: 16,
            //           children: monstera.map((av) {
            //             return InkWell(
            //               onTap: () {
            //                 Navigator.push(
            //                   context,
            //                   MaterialPageRoute(builder: (context) {
            //                     return DetailMobile(plants: av);
            //                   }),
            //                 );
            //               },
            //               child: Card(
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.stretch,
            //                   children: [
            //                     Expanded(
            //                       child: Image.asset(
            //                         av.imgAsset,
            //                         fit: BoxFit.cover,
            //                       ),
            //                     ),
            //                     const SizedBox(height: 8),
            //                     Padding(
            //                       padding: const EdgeInsets.only(left: 8.0),
            //                       child: Text(
            //                         av.name,
            //                         style: const TextStyle(
            //                           fontSize: 16.0,
            //                           fontWeight: FontWeight.bold,
            //                         ),
            //                       ),
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.only(
            //                         left: 8.0,
            //                         bottom: 8.0,
            //                       ),
            //                       child: Text(av.rating),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             );
            //           }).toList(),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

//web page
//adanya implementasi TickerProviderStateMixin untuk komponent tabbar dimana dibutuhkan
//StatefulWidget dan saat diconvert menjadi StatelessWidget akan terjadi error

class HomeWeb extends StatelessWidget {
  final DataItem item;
  const HomeWeb({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CText(text: 'Hei', size: 16),
                  CText(
                    text: 'There!',
                    size: 25,
                    color: Colors.green.shade700,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // Container(
            //   margin: const EdgeInsets.only(left: 15),
            //   child: Align(
            //     alignment: Alignment.centerLeft,
            //     child: TabBar(
            //       labelColor: Colors.green,
            //       controller: controller,
            //       tabs: const [
            //         Tab(text: 'Aloevera'),
            //         Tab(text: 'Cactus'),
            //         Tab(text: 'Monstera'),
            //       ],
            //     ),
            //   ),
            // ),
            // Container(
            //   height: 500,
            //   width: double.infinity,
            //   padding: const EdgeInsets.only(left: 20, right: 20),
            //   child: TabBarView(
            //     controller: controller,
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: GridView.count(
            //           crossAxisCount: 5,
            //           crossAxisSpacing: 16,
            //           mainAxisSpacing: 16,
            //           children: aloevera.map((av) {
            //             return InkWell(
            //               onTap: () {
            //                 Navigator.push(
            //                   context,
            //                   MaterialPageRoute(builder: (context) {
            //                     return DetailWeb(plants: av);
            //                   }),
            //                 );
            //               },
            //               child: Card(
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.stretch,
            //                   children: [
            //                     Expanded(
            //                       child: Image.asset(
            //                         av.imgAsset,
            //                         fit: BoxFit.cover,
            //                       ),
            //                     ),
            //                     const SizedBox(height: 8),
            //                     Padding(
            //                       padding: const EdgeInsets.only(left: 8.0),
            //                       child: Text(
            //                         av.name,
            //                         style: const TextStyle(
            //                           fontSize: 16.0,
            //                           fontWeight: FontWeight.bold,
            //                         ),
            //                       ),
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.only(
            //                         left: 8.0,
            //                         bottom: 8.0,
            //                       ),
            //                       child: Text(av.rating),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             );
            //           }).toList(),
            //         ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: GridView.count(
            //           crossAxisCount: 5,
            //           crossAxisSpacing: 16,
            //           mainAxisSpacing: 16,
            //           children: cactus.map((av) {
            //             return InkWell(
            //               onTap: () {
            //                 Navigator.push(
            //                   context,
            //                   MaterialPageRoute(builder: (context) {
            //                     return DetailWeb(plants: av);
            //                   }),
            //                 );
            //               },
            //               child: Card(
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.stretch,
            //                   children: [
            //                     Expanded(
            //                       child: Image.asset(
            //                         av.imgAsset,
            //                         fit: BoxFit.cover,
            //                       ),
            //                     ),
            //                     const SizedBox(height: 8),
            //                     Padding(
            //                       padding: const EdgeInsets.only(left: 8.0),
            //                       child: Text(
            //                         av.name,
            //                         style: const TextStyle(
            //                           fontSize: 16.0,
            //                           fontWeight: FontWeight.bold,
            //                         ),
            //                       ),
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.only(
            //                         left: 8.0,
            //                         bottom: 8.0,
            //                       ),
            //                       child: Text(av.rating),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             );
            //           }).toList(),
            //         ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: GridView.count(
            //           crossAxisCount: 5,
            //           crossAxisSpacing: 16,
            //           mainAxisSpacing: 16,
            //           children: monstera.map((av) {
            //             return InkWell(
            //               onTap: () {
            //                 Navigator.push(context, MaterialPageRoute(
            //                   builder: (context) {
            //                     return DetailWeb(plants: av);
            //                   },
            //                 ));
            //               },
            //               child: Card(
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.stretch,
            //                   children: [
            //                     Expanded(
            //                       child: Image.asset(
            //                         av.imgAsset,
            //                         fit: BoxFit.cover,
            //                       ),
            //                     ),
            //                     const SizedBox(height: 8),
            //                     Padding(
            //                       padding: const EdgeInsets.only(left: 8.0),
            //                       child: Text(
            //                         av.name,
            //                         style: const TextStyle(
            //                           fontSize: 16.0,
            //                           fontWeight: FontWeight.bold,
            //                         ),
            //                       ),
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.only(
            //                         left: 8.0,
            //                         bottom: 8.0,
            //                       ),
            //                       child: Text(av.rating),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             );
            //           }).toList(),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
