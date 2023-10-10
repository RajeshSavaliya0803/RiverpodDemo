import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/models/food_model.dart';
import 'package:riverpod_demo/services/service.dart';

final foodDataProvider = FutureProvider<List<FoodPayload>>((ref) async {
  return ref.watch(userProvider).getFoodList('RES1617874827ZTC105101');
});
