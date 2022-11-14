
import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class CameraData {
  @HiveField(0)
  final String id;

  CameraData({required this.id});
}
