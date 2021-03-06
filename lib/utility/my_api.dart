import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ungrci/models/user_model.dart';
import 'package:ungrci/utility/my_constant.dart';

class MyAPI {
  Future<UserModel> getUserWhereUser(String user) async {
    String url =
        '${MyConstant().domain}/RCI/getUserWhereUserUng.php?isAdd=true&User=$user';
    Response response = await Dio().get(url);
    print('res = $response');
    if (response.toString() == 'null') {
      return null;
    } else {
      var result = json.decode(response.data);
      for (var map in result) {
        UserModel model = UserModel.fromJson(map);
        return model;
      }
    }
  }

  MyAPI();
}
