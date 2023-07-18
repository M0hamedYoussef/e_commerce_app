import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_admin/core/class/request_status.dart';
import 'package:e_commerce_admin/core/functions/check_connection.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class Crud {
  Future<Either<RequsetStatus, Map>> getData({
    required String link,
    Map data = const {},
    String? requsetname,
    File? file,
  }) async {
    try {
      if (await checkInternet()) {
        http.Response response;
        if (file != null && requsetname != null) {
          var uri = Uri.parse(link);
          var request = http.MultipartRequest("POST", uri);
          var length = await file.length();
          var stream = http.ByteStream(file.openRead());
          stream.cast();
          var multipartFile = http.MultipartFile(
            requsetname,
            stream,
            length,
            filename: basename(file.path),
          );
          request.files.add(multipartFile);
          data.forEach(
            (key, value) {
              request.fields[key] = value;
            },
          );
          var myrequest = await request.send();
          response = await http.Response.fromStream(myrequest);
        } else {
          response = await http.post(
            Uri.parse(link),
            body: data,
          );
        }
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
