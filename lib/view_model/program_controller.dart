import 'package:flutter/material.dart';

import '../model/programs_response._model.dart';
import '../model/user_error.dart';
import '../repo/api_services.dart';
import '../repo/api_status.dart';

class ProgramController extends ChangeNotifier {
  bool _loading = true;
  List<Item> _programsList = [];
  UserError _userError = UserError(code: 0, message: "No Error");

  bool get loading => _loading;
  List<Item> get programsList => _programsList;
  UserError get userError => _userError;

  ProgramController() {
    getProgramResponse();
  }

  setLoading(bool loadingStatus) async {
    _loading = loadingStatus;
    notifyListeners();
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  getProgramResponse() async {
    setLoading(true);

    var res = await ApiServices.getProgramsApi();

    if (res is Success) {
      setProgramModel(data: res.response as ProgramsResponseModel);
    }
    if (res is Failure) {
      UserError userError =
          UserError(code: res.code, message: res.errorresponse.toString());
      setUserError(userError);
    }
    setLoading(false);
  }

  setProgramModel({required ProgramsResponseModel data}) async {
    _programsList = data.items;

    notifyListeners();
  }
}
