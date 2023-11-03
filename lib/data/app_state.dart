import 'package:plant_app/models/plant_model.dart';

class AppState {
  final List<Plant> data = plants;

  get plantList => data;

  /// handle 
  likeUnlike(int id) {
    int i = data.indexWhere((element) => element.id == id);
    data[i].isLike = !data[i].isLike;
  }
}
