class Plant {
  int id;
  String name;
  String imgAsset;
  String desc;
  String type;
  bool isLike;
  String rare;

  Plant({
    required this.id,
    required this.name,
    required this.imgAsset,
    required this.desc,
    required this.type,
    this.isLike = false,
    required this.rare,
  });
}

var plants = [
  Plant(
    id: 1,
    type: 'aloevera',
    name: 'Aloe Vera Av',
    imgAsset: 'images/aloevera-1.jpg',
    rare: 'a',
    desc:
        'Aloe is a cactus-like plant that grows in hot, dry climates. It is cultivated in subtropical regions around the world. Aloe has been used for skin conditions and was thought to improve baldness and promote wound healing',
  ),
  Plant(
    id: 2,
    type: 'monstera',
    name: 'Monstera Av',
    rare: 'b',
    imgAsset: 'images/monstera-1.jpg',
    desc:
        'Monstera are species of evergreen tropical vines and shrubs. They are famous for their natural leaf-holes, which has led to the rise of their nickname and are theorized to maximize sun fleck capture on the forest floor by increasing the spread of the leaf while decreasing the mass of leaf cells to support.',
  ),
  Plant(
    id: 3,
    type: 'cactus',
    name: 'Cactus Av',
    imgAsset: 'images/cactus-1.jpg',
    rare: 'a',
    desc:
        'Cactus is a multi-disciplinary design firm rooted in three core disciplines: brand strategy, digital technology, and architecture. Together with our partners, we give dimension to ideas, creating real world experiences that are not only immersive and interactive, but inspiring and meaningful.',
  ),
  Plant(
    id: 4,
    type: 'aloevera',
    name: 'Aloe Vera Bv',
    imgAsset: 'images/aloevera-2.jpg',
    desc:
        'Aloe is a cactus-like plant that grows in hot, dry climates. It is cultivated in subtropical regions around the world. Aloe has been used for skin conditions and was thought to improve baldness and promote wound healing',
    rare: 'a',
  ),
  Plant(
    id: 5,
    type: 'monstera',
    name: 'Monstera Bv',
    imgAsset: 'images/monstera-2.jpg',
    rare: 'b',
    desc:
        'Monstera are species of evergreen tropical vines and shrubs. They are famous for their natural leaf-holes, which has led to the rise of their nickname and are theorized to maximize sun fleck capture on the forest floor by increasing the spread of the leaf while decreasing the mass of leaf cells to support.',
  ),
  Plant(
    id: 6,
    type: 'cactus',
    name: 'Cactus Bv',
    imgAsset: 'images/cactus-2.jpg',
    rare: 'a',
    desc:
        'Cactus is a multi-disciplinary design firm rooted in three core disciplines: brand strategy, digital technology, and architecture. Together with our partners, we give dimension to ideas, creating real world experiences that are not only immersive and interactive, but inspiring and meaningful.',
  ),
  Plant(
    id: 7,
    type: 'aloevera',
    name: 'Aloe Vera Cv',
    imgAsset: 'images/aloevera-3.jpg',
    rare: 'c',
    desc:
        'Aloe is a cactus-like plant that grows in hot, dry climates. It is cultivated in subtropical regions around the world. Aloe has been used for skin conditions and was thought to improve baldness and promote wound healing',
  ),
  Plant(
    id: 8,
    type: 'monstera',
    name: 'Monstera Cv',
    imgAsset: 'images/monstera-3.jpg',
    rare: 'b',
    desc:
        'Monstera are species of evergreen tropical vines and shrubs. They are famous for their natural leaf-holes, which has led to the rise of their nickname and are theorized to maximize sun fleck capture on the forest floor by increasing the spread of the leaf while decreasing the mass of leaf cells to support.',
  ),
  Plant(
    id: 9,
    type: 'cactus',
    name: 'Cactus Cv',
    imgAsset: 'images/cactus-3.jpg',
    rare: 'b',
    desc:
        'Cactus is a multi-disciplinary design firm rooted in three core disciplines: brand strategy, digital technology, and architecture. Together with our partners, we give dimension to ideas, creating real world experiences that are not only immersive and interactive, but inspiring and meaningful.',
  ),
  Plant(
    id: 10,
    type: 'aloevera',
    name: 'Aloe Vera Dv',
    imgAsset: 'images/aloevera-4.jpg',
    rare: 'c',
    desc:
        'Aloe is a cactus-like plant that grows in hot, dry climates. It is cultivated in subtropical regions around the world. Aloe has been used for skin conditions and was thought to improve baldness and promote wound healing',
  ),
  Plant(
    id: 11,
    type: 'monstera',
    name: 'Monstera Dv',
    rare: 'c',
    imgAsset: 'images/monstera-4.jpg',
    desc:
        'Monstera are species of evergreen tropical vines and shrubs. They are famous for their natural leaf-holes, which has led to the rise of their nickname and are theorized to maximize sun fleck capture on the forest floor by increasing the spread of the leaf while decreasing the mass of leaf cells to support.',
  ),
  Plant(
    id: 12,
    type: 'cactus',
    name: 'Cactus Dv',
    imgAsset: 'images/cactus-4.jpg',
    rare: 'c',
    desc:
        'Cactus is a multi-disciplinary design firm rooted in three core disciplines: brand strategy, digital technology, and architecture. Together with our partners, we give dimension to ideas, creating real world experiences that are not only immersive and interactive, but inspiring and meaningful.',
  ),
];
