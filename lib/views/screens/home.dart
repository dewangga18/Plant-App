import 'package:flutter/material.dart';
import 'package:plant_app/data/app_state.dart';
import 'package:plant_app/models/plant_model.dart';
import 'package:plant_app/views/components/c_text.dart';
import 'package:plant_app/views/components/card_item.dart';
import 'package:plant_app/views/components/choose_menu_button.dart';
import 'package:plant_app/views/components/search_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600) {
          return const HomeMobile();
        } else {
          return const HomeWeb();
        }
      },
    );
  }
}

class HomeMobile extends StatefulWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  List<String> pages = ['All', 'Aloevera', 'Monstera', 'Cactus'];
  int index = 0;
  List<Plant> listHome = AppState().plantList;
  List<Plant> listSearch = AppState().plantList;
  bool searchActivate = false;
  double witdth = 45;

  FocusNode focus = FocusNode();

  String keySearch = '';

  @override
  void dispose() {
    focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
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
                  AnimatedContainer(
                    width: witdth,
                    duration: const Duration(milliseconds: 500),
                    child: Builder(
                      builder: (_) {
                        if (searchActivate) {
                          return SearchField(
                            focus: focus,
                            onChanged: (value) {
                              setState(() => keySearch = value ?? '');
                            },
                            closeTap: () {
                              focus.unfocus();
                              setState(() {
                                witdth = 45;
                                keySearch = '';
                              });
                              Future.delayed(
                                const Duration(milliseconds: 450),
                                () {
                                  setState(() => searchActivate = false);
                                },
                              );
                            },
                          );
                        } else {
                          return ElevatedButton(
                            onPressed: () {
                              setState(() {
                                witdth =
                                    MediaQuery.of(context).size.width * 0.8;
                                index = 0;
                                listSearch = AppState().plantList;
                              });
                              Future.delayed(
                                const Duration(milliseconds: 500),
                                () => focus.requestFocus(),
                              );
                              Future.delayed(
                                const Duration(milliseconds: 100),
                                () {
                                  setState(() => searchActivate = true);
                                },
                              );
                            },
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
                              fixedSize: const Size(30, 40),
                            ),
                            child: Icon(
                              Icons.search,
                              size: 20,
                              color: Colors.green.shade800,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      itemCount: pages.length,
                      itemBuilder: (_, i) {
                        return ChooseMenuButton(
                          text: pages[i],
                          isActive: i == index,
                          onTap: () {
                            setState(() {
                              index = i;
                            });
                          },
                        );
                      },
                      separatorBuilder: (_, i) => const SizedBox(width: 10),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            if (searchActivate)
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  padding: const EdgeInsets.only(bottom: 10),
                  itemCount: keySearch.isEmpty
                      ? listSearch.length
                      : listSearch.where((element) {
                          return element.name.toLowerCase().contains(keySearch);
                        }).length,
                  itemBuilder: (_, i) {
                    if (keySearch.isEmpty) {
                      return CardItem(item: listSearch[i]);
                    } else {
                      var item = listSearch.where((element) {
                        return element.name.toLowerCase().contains(keySearch);
                      }).elementAt(i);

                      return CardItem(item: item);
                    }
                  },
                ),
              )
            else
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  padding: const EdgeInsets.only(bottom: 10),
                  itemCount: listHome.where((item) {
                    if (index == 1) {
                      return item.type == 'aloevera';
                    } else if (index == 2) {
                      return item.type == 'monstera';
                    } else if (index == 3) {
                      return item.type == 'cactus';
                    }
                    return item.name.isNotEmpty;
                  }).length,
                  itemBuilder: (_, i) {
                    var item = listHome.where((item) {
                      if (index == 1) {
                        return item.type == 'aloevera';
                      } else if (index == 2) {
                        return item.type == 'monstera';
                      } else if (index == 3) {
                        return item.type == 'cactus';
                      }
                      return item.name.isNotEmpty;
                    }).elementAt(i);

                    return CardItem(item: item);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class HomeWeb extends StatefulWidget {
  const HomeWeb({Key? key}) : super(key: key);

  @override
  State<HomeWeb> createState() => _HomeWebState();
}

class _HomeWebState extends State<HomeWeb> {
  List<String> pages = ['All', 'Aloevera', 'Monstera', 'Cactus'];
  int index = 0;
  List<Plant> listHome = AppState().plantList;
  List<Plant> listSearch = AppState().plantList;
  bool searchActivate = false;
  double witdth = 45;

  FocusNode focus = FocusNode();

  String keySearch = '';

  @override
  void dispose() {
    focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
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
                  AnimatedContainer(
                    width: witdth,
                    duration: const Duration(milliseconds: 500),
                    child: Builder(
                      builder: (_) {
                        if (searchActivate) {
                          return SearchField(
                            focus: focus,
                            onChanged: (value) {
                              setState(() => keySearch = value ?? '');
                            },
                            closeTap: () {
                              focus.unfocus();
                              setState(() {
                                witdth = 45;
                                keySearch = '';
                              });
                              Future.delayed(
                                const Duration(milliseconds: 450),
                                () {
                                  setState(() => searchActivate = false);
                                },
                              );
                            },
                          );
                        } else {
                          return ElevatedButton(
                            onPressed: () {
                              setState(() {
                                witdth =
                                    MediaQuery.of(context).size.width * 0.3;
                                index = 0;
                                listSearch = AppState().plantList;
                              });
                              Future.delayed(
                                const Duration(milliseconds: 500),
                                () => focus.requestFocus(),
                              );
                              Future.delayed(
                                const Duration(milliseconds: 100),
                                () {
                                  setState(() => searchActivate = true);
                                },
                              );
                            },
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
                              fixedSize: const Size(30, 40),
                            ),
                            child: Icon(
                              Icons.search,
                              size: 20,
                              color: Colors.green.shade800,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      itemCount: pages.length,
                      itemBuilder: (_, i) {
                        return ChooseMenuButton(
                          text: pages[i],
                          isActive: i == index,
                          onTap: () {
                            setState(() {
                              index = i;
                            });
                          },
                        );
                      },
                      separatorBuilder: (_, i) => const SizedBox(width: 10),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            if (searchActivate)
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                  ),
                  padding: const EdgeInsets.only(bottom: 10),
                  itemCount: keySearch.isEmpty
                      ? listSearch.length
                      : listSearch.where((element) {
                          return element.name.toLowerCase().contains(keySearch);
                        }).length,
                  itemBuilder: (_, i) {
                    if (keySearch.isEmpty) {
                      return CardItem(
                        item: listSearch[i],
                        isMobile: false,
                        onlyTitle: true,
                      );
                    } else {
                      var item = listSearch.where((element) {
                        return element.name.toLowerCase().contains(keySearch);
                      }).elementAt(i);

                      return CardItem(
                        item: item,
                        isMobile: false,
                        onlyTitle: true,
                      );
                    }
                  },
                ),
              )
            else
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                  ),
                  padding: const EdgeInsets.only(bottom: 10),
                  itemCount: listHome.where((item) {
                    if (index == 1) {
                      return item.type == 'aloevera';
                    } else if (index == 2) {
                      return item.type == 'monstera';
                    } else if (index == 3) {
                      return item.type == 'cactus';
                    }
                    return item.name.isNotEmpty;
                  }).length,
                  itemBuilder: (_, i) {
                    var item = listHome.where((item) {
                      if (index == 1) {
                        return item.type == 'aloevera';
                      } else if (index == 2) {
                        return item.type == 'monstera';
                      } else if (index == 3) {
                        return item.type == 'cactus';
                      }
                      return item.name.isNotEmpty;
                    }).elementAt(i);

                    return CardItem(item: item, isMobile: false);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
