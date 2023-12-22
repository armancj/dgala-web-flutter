class ShoesCatalogo {
  final int id;
  final String name;
  final String img;
  final String gendre;
  final List<int> colors;
  final List<String> categories;
  final int evaluation;
  final String price;
  final int colorPrice;

  ShoesCatalogo({
    required this.id,
    required this.name,
    required this.img,
    required this.gendre,
    required this.colors,
    required this.categories,
    required this.evaluation,
    required this.price,
    required this.colorPrice,
  });

  factory ShoesCatalogo.fromJson(Map<String, dynamic> json) {
    String gendre = "";
    switch (json["gender"]) {
      case "men":
        gendre = "Hombre";
        break;
      case "women":
        gendre = "Mujer";
        break;
      case "unisex":
        gendre = "Unisex";
        break;
      default:
        "Indefinido";
    }
    return ShoesCatalogo(
      id: json["id"],
      name: json["name"],
      img: "shoes4.png",
      gendre: gendre,
      colors: [],
      categories: [],
      evaluation: json["stars"],
      price: json["price"].toString(),
      colorPrice: 0xffCE3953,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "img": img,
        "gendre": gendre,
        "colors": colors,
        "categories": categories,
        "evaluation": evaluation,
        "price": price,
        "colorPrice": colorPrice,
      };

  ShoesCatalogo copy() => ShoesCatalogo(
        id: id,
        name: name,
        img: img,
        gendre: gendre,
        colors: colors,
        categories: categories,
        evaluation: evaluation,
        price: price,
        colorPrice: colorPrice,
      );
}
