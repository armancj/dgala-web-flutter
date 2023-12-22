import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dgala/src/api/error_handling_api.dart';
import 'package:flutter_dgala/src/models/product_reqres_model.dart';
import 'package:flutter_dgala/src/models/detail_reqres_model.dart';
import 'package:flutter_dgala/src/widgets/custom_dialog.dart';
/* import 'package:flutter_dgala/src/models/model_shoes_catalogo.dart'; */
/* import 'package:logger/logger.dart'; */
/* import 'package:flutter_dgala/src/data/data.dart'; */

class ProductsApi {
  final Dio _dio = Dio();
  /* final Logger _logger = Logger(); */
  final String _host = "http://10.11.14.3:5000";
  late CatalogoResponse catalogoResponse;
  late DetailResponse detailResponse;

  Future<CatalogoResponse> productsCtlg(BuildContext context) async {
    try {
      final response = await _dio.get('$_host/api/rest/v1/products');

      if (response.statusCode == 200) {
        catalogoResponse = CatalogoResponse.fromJson(response.data!);
        return catalogoResponse;
      } else {
        throw Exception(["Error en la conexion"]);
      }
    } on DioException catch (dioError) {
      final errorMessage = DioExceptionApi.fromDioError(dioError).message;
      showCustomDialog(context, errorMessage[0], errorMessage[1]);
      throw Exception("NUNCA SE DEBERIA MANDAR???");
    } catch (e) {
      throw Exception("PQ LLEGO AKI????");
    }
  }

  Future<DetailResponse> productDetails(
    BuildContext context,
    int id,
    String hexadecimal,
  ) async {
    try {
      final response = await _dio.get('$_host/api/rest/v1/products/$id');
      /* final response = await _dio
          .get('$_host/api/rest/v1/products/$id?hexadecimal=$hexadecimal'); */
      /* final response = await _dio
          .get('$_host/api/rest/v1/products/163?hexadecimal=%23FFFF00'); */

      if (response.statusCode == 200) {
        detailResponse = DetailResponse.fromJson(response.data!);
        return detailResponse;
      } else {
        throw Exception(["Error en la conexión"]);
      }
    } on DioException catch (dioError) {
      final errorMessage = DioExceptionApi.fromDioError(dioError).message;
      showCustomDialog(context, errorMessage[0], errorMessage[1]);
      throw Exception("NUNCA SE DEBERIA MANDAR???");
    } catch (e) {
      throw Exception("PQ LLEGO AKI????");
    }
  }
}
