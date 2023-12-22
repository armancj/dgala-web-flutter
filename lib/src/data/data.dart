import 'package:flutter_dgala/src/models/model_shoes_catalogo.dart';
import 'package:flutter_dgala/src/models/model_shoes_discount.dart';

var carouselShoes = <ShoesDiscount>[
  ShoesDiscount(
    id: 1,
    name: "Pranks",
    img: "shoes1.png",
    components: <String>[
      "15% de hilo extrafuerte",
      "25% de caucho engomado",
      "15% de algodón",
      "25% de cuero reforzado",
      "20% de cuero sintetico",
    ],
    colors: <int>[
      0xffdfa18c,
      0xFEFA7144,
      0xFF4C4C4C,
    ],
    variantes: <String>[
      "shoes1.png",
      "shoes1naranja.png",
      "shoes1grises.png",
    ],
    oldPrice: "5000.00",
    newPrice: "4500.00",
    colorNewPrice: 0xffdfa18c,
  ),
  ShoesDiscount(
    id: 2,
    name: "Lorens",
    img: "shoes4.png",
    components: <String>[
      "25% de caucho engomado",
      "15% de algodón",
      "25% de cuero reforzado",
      "20% de cuero sintetico",
      "15% de hilo extrafuerte",
    ],
    colors: <int>[
      0xffCE3953,
    ],
    variantes: <String>[
      "shoes4.png",
    ],
    oldPrice: "5500.00",
    newPrice: "5000.00",
    colorNewPrice: 0xffCE3953,
  ),
  ShoesDiscount(
    id: 3,
    name: "Amadeus",
    img: "shoes3.png",
    components: <String>[
      "25% de caucho engomado",
      "25% de cuero reforzado",
      "20% de cuero sintetico",
      "15% de algodón",
      "15% de hilo extrafuerte",
    ],
    colors: <int>[
      0xffffe6c5,
      0xff373333,
    ],
    variantes: <String>[
      "shoes3.png",
      "shoes3negro.png",
    ],
    oldPrice: "6500.00",
    newPrice: "6000.00",
    colorNewPrice: 0xffffe6c5,
  ),
];

var catalogoShoes = <ShoesCatalogo>[
  /* ShoesCatalogo(
    id: 1,
    name: "Pranks",
    img: "shoes1.png",
    gendre: "Unisex",
    colors: <int>[
      0xffdfa18c,
      0xFEFA7144,
      0xFF4C4C4C,
    ],
    categories: <String>["Niños", "Modernos"],
    price: "5000.00",
    colorPrice: 4291705171,
    evaluation: 3,
  ), */
];

/* var catalogoShoes = <ShoesCatalogo>[
  ShoesCatalogo(
    id: 1,
    name: "Pranks",
    img: "shoes1.png",
    gendre: "Unisex",
    colors: <int>[
      0xffdfa18c,
      0xFEFA7144,
      0xFF4C4C4C,
    ],
    categories: <String>["Niños", "Modernos"],
    price: "5000.00",
    colorPrice: 4291705171,
    evaluation: 3,
  ),
  ShoesCatalogo(
    id: 2,
    name: "Zarash",
    img: "shoes3.png",
    gendre: "Hombre",
    colors: <int>[
      0xffdfa18c,
      0xFEFA7144,
      0xFF4C4C4C,
    ],
    categories: <String>["Niños", "Modernos"],
    price: "5000.00",
    colorPrice: 0xffffe6c5,
    evaluation: 3,
  ),
  ShoesCatalogo(
    id: 3,
    name: "Blins",
    img: "shoes4.png",
    gendre: "Mujer",
    colors: <int>[
      0xffdfa18c,
      0xFEFA7144,
      0xFF4C4C4C,
    ],
    categories: <String>["Niños", "Modernos"],
    price: "5000.00",
    colorPrice: 0xffCE3953,
    evaluation: 5,
  ),
  ShoesCatalogo(
    id: 4,
    name: "Pranks",
    img: "shoes1.png",
    gendre: "Unisex",
    colors: <int>[
      0xffdfa18c,
      0xFEFA7144,
      0xFF4C4C4C,
    ],
    categories: <String>["Niños", "Modernos"],
    price: "5000.00",
    colorPrice: 0xffdfa18c,
    evaluation: 5,
  ),
  ShoesCatalogo(
    id: 5,
    name: "Blins",
    img: "shoes4.png",
    gendre: "Mujer",
    colors: <int>[
      0xffdfa18c,
      0xFEFA7144,
      0xFF4C4C4C,
    ],
    categories: <String>["Niños", "Modernos"],
    price: "5000.00",
    colorPrice: 0xffCE3953,
    evaluation: 5,
  ),
  ShoesCatalogo(
    id: 6,
    name: "Pranks",
    img: "shoes3.png",
    gendre: "Hombre",
    colors: <int>[
      0xffdfa18c,
      0xFEFA7144,
      0xFF4C4C4C,
    ],
    categories: <String>["Niños", "Modernos"],
    price: "5000.00",
    colorPrice: 0xffffe6c5,
    evaluation: 5,
  ),
]; */
