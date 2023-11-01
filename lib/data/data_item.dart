import 'package:plant_app/models/plant_model.dart';

class DataItem {
  List<Plant> listData;
  Function(Plant)? tapAdd;
  Function(Plant)? tapDelete;

  DataItem({
    required this.listData,
    this.tapAdd,
    this.tapDelete,
  }) {
    tapAdd = (Plant plant) => listData.add(plant);
    tapDelete = (Plant plant) {
      listData.removeWhere((element) => element.name == plant.name);
    };
  }
}
