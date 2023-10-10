import 'dart:convert';
import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import '../models/food_model.dart';

class ApiServices {
  static const String baseUrl = "http://54.190.192.105:9116";

  Future<List<FoodPayload>> getFoodList(String restoId) async {
    Response response = await get(Uri.parse(
        '$baseUrl/api/item/get-item-category-list?restaurant_id=$restoId'));
    log("RESPONSE ->${response.body}");
    if (response.statusCode == 200) {
      final foodResponse = foodItemResponseFromJson(response.body);
      return foodResponse.getFoodPayload!;
      // final dynamic responseBody = jsonDecode(response.body);
      // if (responseBody != null && responseBody['payload'] != null) {
      //   final List<dynamic>? payloadList = responseBody['payload'];
      //   if (payloadList != null) {
      //     return payloadList.map((e) => FoodPayload.fromJson(e)).toList();
      //   }
      // }
    }
    return [];
  }
}

final userProvider = Provider<ApiServices>((ref) => ApiServices());
