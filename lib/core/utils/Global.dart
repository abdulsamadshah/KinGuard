import 'package:flutter/services.dart';
import 'package:kinguard/core/theme/app_colors.dart';
import 'package:kinguard/core/utils/storage_services.dart';

class Global {
  static late StorageServices storageServices;

  static Future init() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.primary,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
    storageServices = await StorageServices().init();
  }
}
