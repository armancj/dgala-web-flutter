// To parse this JSON data, do
//
//     final catalogoResponse = catalogoResponseFromJson(jsonString);

import 'dart:convert';

CatalogoResponse catalogoResponseFromJson(String str) =>
    CatalogoResponse.fromJson(json.decode(str));

String catalogoResponseToJson(CatalogoResponse data) =>
    json.encode(data.toJson());

class CatalogoResponse {
  final Data data;

  CatalogoResponse({
    required this.data,
  });

  factory CatalogoResponse.fromJson(Map<String, dynamic> json) =>
      CatalogoResponse(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  final List<Product> result;
  final int count;
  final int total;

  Data({
    required this.result,
    required this.count,
    required this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        result:
            List<Product>.from(json["result"].map((x) => Product.fromJson(x))),
        count: json["count"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
        "count": count,
        "total": total,
      };
}

class Product {
  final int id;
  final String name;
  final int price;
  final dynamic priceCut;
  final String content;
  final String gender;
  final List<String> sizes;
  final int stock;
  final String slug;
  final List<String> tags;
  final int stars;
  final int viewCount;
  final int reviewsTotal;
  final String colorDefault;
  final List<Photo> photo;
  final List<dynamic> reviews;
  final DateTime createdAt;
  final DateTime updatedAt;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.priceCut,
    required this.content,
    required this.gender,
    required this.sizes,
    required this.stock,
    required this.slug,
    required this.tags,
    required this.stars,
    required this.viewCount,
    required this.reviewsTotal,
    required this.colorDefault,
    required this.photo,
    required this.reviews,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        priceCut: json["priceCut"],
        content: json["content"],
        gender: json["gender"],
        sizes: List<String>.from(json["sizes"].map((x) => x)),
        stock: json["stock"],
        slug: json["slug"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        stars: json["stars"],
        viewCount: json["viewCount"],
        reviewsTotal: json["reviewsTotal"],
        colorDefault: json["colorDefault"],
        photo: List<Photo>.from(json["photo"].map((x) => Photo.fromJson(x))),
        reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "priceCut": priceCut,
        "content": content,
        "gender": gender,
        "sizes": List<dynamic>.from(sizes.map((x) => x)),
        "stock": stock,
        "slug": slug,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "stars": stars,
        "viewCount": viewCount,
        "reviewsTotal": reviewsTotal,
        "colorDefault": colorDefault,
        "photo": List<dynamic>.from(photo.map((x) => x.toJson())),
        "reviews": List<dynamic>.from(reviews.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Photo {
  final int id;
  final String name;
  final String url;

  Photo({
    required this.id,
    required this.name,
    required this.url,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
      };
}
