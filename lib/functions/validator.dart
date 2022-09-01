import 'package:get/utils.dart';

validator(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "*required";
  }
  if (type == 'username') {
    if (!GetUtils.isUsername(val)) {
      return 'User is not valid';
    }
  }
  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return 'Email is not valid';
    }
  }

  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(val)) {
      return 'Phone is not valid';
    }
  }

  if (val.length < min) {
    return "cannot be less than $min";
  }

  if (val.length > max) {
    return "cannot be larger than $max";
  }
}
