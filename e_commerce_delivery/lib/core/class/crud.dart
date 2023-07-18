import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_delivery/core/class/request_status.dart';
import 'package:e_commerce_delivery/core/functions/check_connection.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<RequsetStatus, Map>> getData(
      {required String link, Map data = const {}}) async {
    try {
      if (await checkInternet()) {
        http.Response response = await http.post(
          Uri.parse(link),
          body: data,
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          var decodedBody = jsonDecode(response.body);
          return Right(decodedBody);
        } else {
          return const Left(RequsetStatus.serverError);
        }
      } else {
        return const Left(RequsetStatus.offline);
      }
    } catch (e) {
      return const Left(RequsetStatus.codeError);
    }
  }
}
