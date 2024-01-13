import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:store_app/core/class/statusreqwest.dart';
import 'package:store_app/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postrequest(
      String linkrequest, Map data) async {
    try {
      if (await checkinternet()) {
        var respons = await http.post(Uri.parse(linkrequest), body: data);

        if ("${respons.statusCode}" == "200" ||
            "${respons.statusCode}" == "201") {
          var responsbody = jsonDecode(respons.body);
          return Right(responsbody);
        } else {
          return left(StatusRequest.serverfailur);
        }
      } else {
        return left(StatusRequest.offlinefailur);
      }
    } catch (e) {
      return left(StatusRequest.serverfailur);
    }
  }
}
