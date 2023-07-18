import 'package:e_commerce_delivery/core/class/request_status.dart';

statusUpdater({required var response}) {
  if (response is RequsetStatus) {
    return response;
  } else {
    return RequsetStatus.success;
  }
}
