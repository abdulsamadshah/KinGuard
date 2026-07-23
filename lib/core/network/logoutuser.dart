import 'package:kinguard/Routes/app_route_config.dart';
import 'package:kinguard/Routes/app_route_constants.dart';
import 'package:kinguard/core/constants/pref_res.dart';
import 'package:kinguard/core/utils/Global.dart';

class LogoutUser {
  logout() {
    Global.storageServices.remove(PrefConst.STORAGE_USER_TOKEN_KEY);
    Global.storageServices.remove(PrefConst.DEVICE_ID);

    appRouter.router.go(RouteConstants.loginScreen);
  }
}
