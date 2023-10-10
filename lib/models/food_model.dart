import 'dart:convert';
import '../services/api_response.dart';

FoodItemResponse foodItemResponseFromJson(String str) =>
    FoodItemResponse.fromJson(json.decode(str));

class FoodItemResponse {
  FoodItemResponse({
    this.error,
    this.getFoodPayload,
    this.status,
  });

  ErrorPayload? error;
  List<FoodPayload>? getFoodPayload;
  int? status;

  factory FoodItemResponse.fromJson(Map<String, dynamic> json) =>
      FoodItemResponse(
        error:
            json["error"] != null ? ErrorPayload.fromJson(json["error"]) : null,
        getFoodPayload: List<FoodPayload>.from(
            json["payload"].map((x) => FoodPayload.fromJson(x))),
        status: json["status"],
      );
}

class FoodPayload {
  FoodPayload({
    this.categoryStatus,
    this.itemCategoryId,
    required this.itemList,
    this.catTitle,
  });

  String? categoryStatus;
  String? itemCategoryId;
  List<FoodItem> itemList;
  CatTitle? catTitle;

  factory FoodPayload.fromJson(Map<String, dynamic> json) => FoodPayload(
        categoryStatus: json["category_status"],
        itemCategoryId: json["item_category_id"],
        itemList:
            json["itemList"] != null && (json["itemList"] as List).isNotEmpty
                ? List<FoodItem>.from(
                    json["itemList"].map((x) => FoodItem.fromJson(x)))
                : [],
        catTitle: CatTitle.fromJson(json["catTitle"]),
      );
}

class CatTitle {
  CatTitle({
    this.en,
  });

  String? en;

  factory CatTitle.fromJson(Map<String, dynamic> json) => CatTitle(
        en: json["EN"],
      );
}

class FoodItem {
  FoodItem({
    this.avgRating,
    this.description,
    this.ingredients,
    this.itemId,
    this.catId,
    this.price,
    this.cuisineId,
    this.image,
    this.title,
    this.resizedImage,
    required this.status,
    required this.hold,
    this.allergyInfo,
    this.isVeg,
  });

  int? avgRating;
  CatTitle? description;
  CatTitle? ingredients;
  String? itemId;
  String? catId;
  double? price;
  String? cuisineId;
  String? image;
  CatTitle? title;
  String? resizedImage;
  String status;
  bool hold;
  String? allergyInfo;
  bool? isVeg;

  factory FoodItem.fromJson(Map<String, dynamic> json) => FoodItem(
        avgRating: json["avg_rating"],
        description: CatTitle.fromJson(json["description"]),
        ingredients: json["ingredients"] == null
            ? null
            : CatTitle.fromJson(json["ingredients"]),
        itemId: json["item_id"],
        price: json["price"].toDouble(),
        cuisineId: json["cuisine_id"],
        image: json["image"],
        status: json["status"] ?? '',
        hold: json['hold'] ?? false,
        title: CatTitle.fromJson(json["title"]),
        resizedImage: json["resized_image"],
        allergyInfo: json["allergy_info"],
        isVeg: json["is_veg"],
      );
}
