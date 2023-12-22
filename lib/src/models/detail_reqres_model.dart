// To parse this JSON data, do
//
//     final detailResponse = detailResponseFromJson(jsonString);

import 'dart:convert';

DetailResponse detailResponseFromJson(String str) =>
    DetailResponse.fromJson(json.decode(str));

String detailResponseToJson(DetailResponse data) => json.encode(data.toJson());

class DetailResponse {
  final ProductDetail data;

  DetailResponse({
    required this.data,
  });

  factory DetailResponse.fromJson(Map<String, dynamic> json) => DetailResponse(
        data: ProductDetail.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class ProductDetail {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final String content;
  final dynamic priceCut;
  final int price;
  final String slug;
  final List<String> sizes;
  final List<dynamic> component;
  final int stars;
  final int viewCount;
  final String gender;
  final List<String> tags;
  final int stock;
  final String status;
  final int reviewsTotal;
  final bool deleted;
  final int userId;
  final String colorDefault;
  final List<Photo> photo;
  final List<dynamic> reviews;
  final List<String> colors;
  final String categoryName;

  ProductDetail({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.content,
    required this.priceCut,
    required this.price,
    required this.slug,
    required this.sizes,
    required this.component,
    required this.stars,
    required this.viewCount,
    required this.gender,
    required this.tags,
    required this.stock,
    required this.status,
    required this.reviewsTotal,
    required this.deleted,
    required this.userId,
    required this.colorDefault,
    required this.photo,
    required this.reviews,
    required this.colors,
    required this.categoryName,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        name: json["name"],
        content: json["content"],
        priceCut: json["priceCut"],
        price: json["price"],
        slug: json["slug"],
        sizes: List<String>.from(json["sizes"].map((x) => x)),
        component: List<dynamic>.from(json["component"].map((x) => x)),
        stars: json["stars"],
        viewCount: json["viewCount"],
        gender: json["gender"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        stock: json["stock"],
        status: json["status"],
        reviewsTotal: json["reviewsTotal"],
        deleted: json["deleted"],
        userId: json["userId"],
        colorDefault: json["colorDefault"],
        photo: List<Photo>.from(json["photo"].map((x) => Photo.fromJson(x))),
        reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
        colors: List<String>.from(json["colors"].map((x) => x)),
        categoryName: json["categoryName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "name": name,
        "content": content,
        "priceCut": priceCut,
        "price": price,
        "slug": slug,
        "sizes": List<dynamic>.from(sizes.map((x) => x)),
        "component": List<dynamic>.from(component.map((x) => x)),
        "stars": stars,
        "viewCount": viewCount,
        "gender": gender,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "stock": stock,
        "status": status,
        "reviewsTotal": reviewsTotal,
        "deleted": deleted,
        "userId": userId,
        "colorDefault": colorDefault,
        "photo": List<dynamic>.from(photo.map((x) => x.toJson())),
        "reviews": List<dynamic>.from(reviews.map((x) => x)),
        "colors": List<dynamic>.from(colors.map((x) => x)),
        "categoryName": categoryName,
      };
}

class Photo {
  final int id;
  final String name;
  final String url;
  final String color;

  Photo({
    required this.id,
    required this.name,
    required this.url,
    required this.color,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "color": color,
      };
}
