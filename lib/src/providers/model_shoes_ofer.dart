import 'package:flutter/material.dart';
import 'package:flutter_dgala/src/api/products_api.dart';
import 'package:flutter_dgala/src/models/model_shoes_catalogo.dart';
import 'package:flutter_dgala/src/models/product_reqres_model.dart';
import 'package:flutter_dgala/src/models/detail_reqres_model.dart';

var imageList = [
  "shoes1.png",
];

var colorList = [
  0xffdfa18c,
];

class ModelShoesOfer with ChangeNotifier {
  Color _color = Color(colorList.first);
  String _img = imageList.first;
  double _top = 500.0;

  List<ShoesCatalogo> _dataList = [];

  List<Product> dataCtlgTemp = [];

  //variables para detalles
  List<ProductDetail> _productDetails = [];
  bool _loadingDetails = false;
  List<dynamic> _pohtosDetail = [];
  List<int> _colorsDetail = [];

  //variables para catalogo
  List<Product> _productsCatalogoList = [];
  bool _loadingCtlg = false;
  bool _allLoadedCtlg = false;
  int _currentPageCtlg = 1;
  int _pageSizeCtlg = 10;

  Map<String, String> getFilters() {
    Map<String, String> queryParams = {};
    // Aqui puedes pasar los filtros que desees
    // queryParams['otro_filro_por_otro_campo'] = '';
    // Filtros basico de paginamiento
    queryParams['currentpage'] = _currentPageCtlg.toString();
    queryParams['pagesize'] = _pageSizeCtlg.toString();

    return queryParams;
  }

  Future<void> getProductsCtlg(BuildContext context,
      {bool paginated = false}) async {
    _loadingCtlg = true;
    if (!paginated) {
      _currentPageCtlg = 1;
      _allLoadedCtlg = false;
    }
    notifyListeners();

    //por ahora no estoy usando filters...
    /* Map<String, String> filters = getFilters(); */

    var service = ProductsApi();
    CatalogoResponse response = await service.productsCtlg(context);

    if (response.data.result.isNotEmpty) {
      dataCtlgTemp = response.data.result;
      _allLoadedCtlg = dataCtlgTemp.length < _pageSizeCtlg;
      updateDataCtlg(dataCtlgTemp, paginated);
      _loadingCtlg = false;
      notifyListeners();
    } else {
      print("tenemos que ver que hacemos aqui");
    }
  }

  void updateDataCtlg(List<Product> data, bool paginated) {
    if (!paginated) {
      _productsCatalogoList = data;
      _currentPageCtlg += 1;
    } else {
      _productsCatalogoList.addAll(data);
      _currentPageCtlg += 1;
    }
  }

  //esta pendiendo a ser borrado pues lo use en el futurebuilder...
  /* Future<List<Product>> getProductsCatalogo(BuildContext context,
      {bool paginated = false}) async {
    if (_productsCatalogoList.isNotEmpty) {
      return _productsCatalogoList;
    } else {
      var service = ProductsApi();
      CatalogoResponse response = await service.productsCtlg(context);
      if (response.data.result.isNotEmpty) {
        _productsCatalogoList = response.data.result;
        notifyListeners();
        return _productsCatalogoList;
      } else {
        return _productsCatalogoList;
      }
    }
  } */

  /* Future<ProductDetail> getProductDetails(
      BuildContext context, int productId, String hexadecimal) async {
    /* List<String> colorList = _productDetail.colors;
    bool isInColor = colorList.contains(hexadecimal);
 */

    if (_productDetail.id == productId) {
      return _productDetail;
    } else {
    var service = ProductsApi();
    DetailResponse response =
        await service.productDetails(context, productId, hexadecimal);
    _productDetail = response.data;
    notifyListeners();
    return _productDetail;
    }
  } */

  Future<void> getProductDetails(
      BuildContext context, int productId, String hexadecimal) async {
    _loadingDetails = true;
    notifyListeners();

    var service = ProductsApi();
    DetailResponse response =
        await service.productDetails(context, productId, hexadecimal);

    if (_productDetails.isNotEmpty) {
      _productDetails[0] = response.data;
      _pohtosDetail = _productDetails[0].photo;
      updateColorsDetail(_productDetails[0].colors);
    } else {
      _productDetails.add(response.data);
      _pohtosDetail = _productDetails[0].photo;
      updateColorsDetail(_productDetails[0].colors);
    }
    _loadingDetails = false;
    notifyListeners();
  }

  updateColorsDetail(List<String> colors) {
    List<int> list = [];

    for (var valor in colors) {
      String colorTemp = valor.trim();
      colorTemp = colorTemp.substring(1);
      colorTemp = "0xFF$colorTemp";
      int color = int.parse(colorTemp);
      list.add(color);
    }

    _colorsDetail = list;
    notifyListeners();
  }

  changeColor(int index) {
    _color = Color(colorList[index]);
    notifyListeners();
  }

  changeImage(int index) {
    _img = imageList[index];
    notifyListeners();
  }

  get img {
    return _img;
  }

  set img(param) {
    _img = param;
    notifyListeners();
  }

  get color {
    return _color;
  }

  set color(param) {
    _color = param;
    notifyListeners();
  }

  get top {
    return _top;
  }

  set top(param) {
    _top = param;
    notifyListeners();
  }

  get dataList {
    return _dataList;
  }

  set dataList(param) {
    _dataList = param;
    notifyListeners();
  }

  get loadingDetails {
    return _loadingDetails;
  }

  set loadingDetails(param) {
    _loadingDetails = param;
    notifyListeners();
  }

  get loadingCtlg {
    return _loadingCtlg;
  }

  set loadingCtlg(param) {
    _loadingCtlg = param;
    notifyListeners();
  }

  get allLoadedCtlg {
    return _allLoadedCtlg;
  }

  set allLoadedCtlg(param) {
    _allLoadedCtlg = param;
    notifyListeners();
  }

  get currentPageCtlg {
    return _currentPageCtlg;
  }

  set currentPageCtlg(param) {
    _currentPageCtlg = param;
    notifyListeners();
  }

  get pageSizeCtlg {
    return _pageSizeCtlg;
  }

  set pageSizeCtlg(param) {
    _pageSizeCtlg = param;
    notifyListeners();
  }

  get productsCatalogoList {
    return _productsCatalogoList;
  }

  set productsCatalogoList(param) {
    _productsCatalogoList = param;
    notifyListeners();
  }

  get productDetails {
    return _productDetails;
  }

  set productDetails(param) {
    _productDetails = param;
    notifyListeners();
  }

  get pohtosDetail {
    return _pohtosDetail;
  }

  set pohtosDetail(param) {
    _pohtosDetail = param;
    notifyListeners();
  }

  get colors {
    return _colorsDetail;
  }

  set colors(param) {
    _colorsDetail = param;
    notifyListeners();
  }
}
