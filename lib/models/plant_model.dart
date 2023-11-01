class Plant {
  String name;
  String imgAsset;
  String desc;
  String type;
  bool isLike;
  String rare; /// [a] => special, [b] => rare, [c] => common

  Plant({
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
    type: 'aloevera',
    name: 'Aloe Vera Av',
    imgAsset: 'images/aloevera-1.jpg',
    rare: 'a',
    desc:
        'Aloe Vera tipe Av sangat cocok untuk menambah koleksi bunga-bunga anda!',
  ),
  Plant(
    type: 'monstera',
    name: 'Monstera Av',
    rare: 'b',
    imgAsset: 'images/monstera-1.jpg',
    desc:
        'Monstera tipe Av sangat cocok untuk menambah koleksi bunga-bunga anda!',
  ),
  Plant(
    type: 'cactus',
    name: 'Cactus Av',
    imgAsset: 'images/cactus-1.jpg',
    rare: 'a',
    desc:
        'Cactus tipe Av sangat cocok untuk menambah koleksi bunga-bunga anda!',
  ),
  Plant(
    type: 'aloevera',
    name: 'Aloe Vera Bv',
    imgAsset: 'images/aloevera-2.jpg',
    desc:
        'Aloe Vera tipe Bv sangat cocok untuk menambah koleksi bunga-bunga anda!',
    rare: 'a',
  ),
  Plant(
    type: 'monstera',
    name: 'Monstera Bv',
    imgAsset: 'images/monstera-2.jpg',
    rare: 'b',
    desc:
        'Monstera tipe Bv sangat cocok untuk menambah koleksi bunga-bunga anda!',
  ),
  Plant(
    type: 'cactus',
    name: 'Cactus Bv',
    imgAsset: 'images/cactus-2.jpg',
    rare: 'a',
    desc:
        'Cactus tipe Bv sangat cocok untuk menambah koleksi bunga-bunga anda!',
  ),
  Plant(
    type: 'aloevera',
    name: 'Aloe Vera Cv',
    imgAsset: 'images/aloevera-3.jpg',
    rare: 'c',
    desc:
        'Aloe Vera tipe Cv sangat cocok untuk menambah koleksi bunga-bunga anda!',
  ),
  Plant(
    type: 'monstera',
    name: 'Monstera Cv',
    imgAsset: 'images/monstera-3.jpg',
    rare: 'b',
    desc:
        'Monstera tipe Cv sangat cocok untuk menambah koleksi bunga-bunga anda!',
  ),
  Plant(
    type: 'cactus',
    name: 'Cactus Cv',
    imgAsset: 'images/cactus-3.jpg',
    rare: 'b',
    desc:
        'Cactus tipe Cv sangat cocok untuk menambah koleksi bunga-bunga anda!',
  ),
  Plant(
    type: 'aloevera',
    name: 'Aloe Vera Dv',
    imgAsset: 'images/aloevera-4.jpg',
    rare: 'c',
    desc:
        'Aloe Vera tipe Dv sangat cocok untuk menambah koleksi bunga-bunga anda!',
  ),
  Plant(
    type: 'monstera',
    name: 'Monstera Dv',
    rare: 'c',
    imgAsset: 'images/monstera-4.jpg',
    desc:
        'Monstera tipe Dv sangat cocok untuk menambah koleksi bunga-bunga anda!',
  ),
  Plant(
    type: 'cactus',
    name: 'Cactus Dv',
    imgAsset: 'images/cactus-4.jpg',
    rare: 'c',
    desc:
        'Cactus tipe Dv sangat cocok untuk menambah koleksi bunga-bunga anda!',
  ),
];
