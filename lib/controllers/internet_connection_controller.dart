import 'package:connectivity/connectivity.dart';

import 'package:get/state_manager.dart';

class InternetController extends GetxController {
  var isLoading = true.obs;
  @override
  void onInit() {
    getConnect();
    super.onInit();
  }

  void getConnect() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      isLoading(false);
    } else {
      isLoading(true);
    }
    print(isLoading.value);
  }
}
