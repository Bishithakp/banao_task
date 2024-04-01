import 'dart:io';
import 'package:bana0_task/model/lessons_response_model.dart';
import 'package:bana0_task/model/programs_response._model.dart';
import 'package:bana0_task/repo/api_status.dart';
import 'package:bana0_task/utils/constants/data_constants.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<Object> getProgramsApi() async {
    try {
      var url = Uri.parse(programApi);
      var resp = await http.get(url);

      if (200 == resp.statusCode) {
        ProgramsResponseModel programsResponseModel =
            programsResponseModelFromJson(resp.body);
        return Success(response: programsResponseModel, code: 200);
      } else {
        return Failure(
            code: USER_INVALID_RESPONSE, errorresponse: 'invalid Response');
      }
    } on HttpException {
      return Failure(code: NO_INTERNET, errorresponse: 'NO internet');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorresponse: 'Invalid Format');
    } catch (err) {
      return Failure(code: UNKNOWN_ERROR, errorresponse: err.toString());
    }
  }

  static Future<Object> getLessonsApi() async {
    try {
      var url = Uri.parse(lessonsApi);
      var resp = await http.get(url);

      if (200 == resp.statusCode) {
        print(resp.body);
        LessonsResponseModel lessonsResponseModel =
            lessonsResponseModelFromJson(resp.body);
        return Success(response: lessonsResponseModel, code: 200);
      } else {
        return Failure(
            code: USER_INVALID_RESPONSE, errorresponse: 'invalid Response');
      }
    } on HttpException {
      return Failure(code: NO_INTERNET, errorresponse: 'NO internet');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorresponse: 'Invalid Format');
    } catch (err) {
      return Failure(code: UNKNOWN_ERROR, errorresponse: err.toString());
    }
  }
}
