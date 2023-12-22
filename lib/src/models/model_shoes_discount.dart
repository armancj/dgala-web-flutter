class ShoesDiscount {
  final int id;
  final String name;
  final String img;
  final List<int> colors;
  final List<String> variantes;
  final List<String> components;
  final String oldPrice;
  final String newPrice;
  final int colorNewPrice;

  ShoesDiscount({
    required this.id,
    required this.name,
    required this.img,
    required this.colors,
    required this.variantes,
    required this.components,
    required this.oldPrice,
    required this.newPrice,
    required this.colorNewPrice,
  });

  factory ShoesDiscount.fromJson(Map<String, dynamic> json) {
    return ShoesDiscount(
      id: json["id"],
      name: json["name"],
      img: json["img"],
      colors: json["colors"],
      variantes: json["variantes"],
      components: json["components"],
      oldPrice: json["oldPrice"],
      newPrice: json["newPrice"],
      colorNewPrice: json["colorNewPrice"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "img": img,
        "colors": colors,
        "variantes": variantes,
        "components": components,
        "oldPrice": oldPrice,
        "newPrice": newPrice,
        "colorNewPrice": colorNewPrice,
      };

  ShoesDiscount copy() => ShoesDiscount(
        id: id,
        name: name,
        img: img,
        colors: colors,
        variantes: variantes,
        components: components,
        oldPrice: oldPrice,
        newPrice: newPrice,
        colorNewPrice: colorNewPrice,
      );
}
