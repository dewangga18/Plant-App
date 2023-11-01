import 'package:plant_app/models/plant_model.dart';

class AppState {
  final List<Plant> _plants = plants;

  get plantList => _plants;

  likeDislike(int i) => _plants[i].isLike = !_plants[i].isLike;
}
