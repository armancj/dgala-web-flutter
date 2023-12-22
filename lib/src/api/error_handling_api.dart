import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioExceptionApi implements Exception {
  List<String> message = [];

  DioExceptionApi.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = [
          "Warning",
          "La petición al servidor ha sido cancelada.",
        ];
        break;

      case DioExceptionType.connectionTimeout:
        message = [
          "Error",
          "Se ha agotado el tiempo de la conexión con el servidor.",
        ];
        break;

      case DioExceptionType.sendTimeout:
        message = [
          "Error",
          "Se ha agotado el tiempo de envio al servidor.",
        ];
        break;

      case DioExceptionType.receiveTimeout:
        message = [
          "Error",
          "Se ha agotado el tiempo de espera del servidor.",
        ];
        break;

      case DioExceptionType.connectionError:
        message = [
          "Error",
          "La conexión con el servidor a fallado, revice su conexión a internet.",
        ];
        break;

      case DioExceptionType.badResponse:
        message = _handleException(
          dioError.response!.statusCode,
          dioError.response!.data,
        );
        break;

      default:
        message = [
          "Error",
          "Algo ha salido mal.",
        ];
    }
  }

  List<String> _handleException(int? statusCode, dynamic error) {
    List<String> message = [];
    switch (statusCode) {
      case 400:
        message = [
          "Error",
          "Petición incorrecta.",
        ];
        break;
      case 404:
        message = [
          "Error",
          "${error['message']}.",
        ];
        break;
      case 500:
        message = [
          "Error",
          "Error interno del servidor.",
        ];
        break;
      default:
        message = [
          "Error",
          "Oops! Algo salió mal.",
        ];
    }

    return message;
  }

  @override
  String toString() {
    return message[1];
  }
}
