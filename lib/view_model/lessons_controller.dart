import 'package:bana0_task/repo/api_status.dart';
import 'package:flutter/material.dart';

import '../model/lessons_response_model.dart';
import '../model/user_error.dart';
import '../repo/api_services.dart';

class LessonsController extends ChangeNotifier {
  bool _loading = true;
  List<LessonsItem> _lessonList = [];
  UserError _userError = UserError(code: 0, message: "No Error");

  bool get loading => _loading;
  List<LessonsItem> get lessonList => _lessonList;
  UserError get userError => _userError;

  LessonsController() {
    getLessonsResponse();
  }

  setLoading(bool loadingStatus) async {
    _loading = loadingStatus;
    notifyListeners();
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  getLessonsResponse() async {
    setLoading(true);

    var res = await ApiServices.getLessonsApi();

    if (res is Success) {
      setProgramModel(data: res.response as LessonsResponseModel);
    }
    if (res is Failure) {
      UserError userError =
          UserError(code: res.code, message: res.errorresponse.toString());
      setUserError(userError);
    }
    setLoading(false);
  }

  setProgramModel({required LessonsResponseModel data}) async {
    _lessonList = data.lessonItems;

    notifyListeners();
  }
}
