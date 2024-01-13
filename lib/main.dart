import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/localization/changelocal.dart';
import 'package:store_app/core/localization/tranzlation.dart';
import 'package:store_app/core/services/service.dart';
import 'package:store_app/routes.dart';

import 'bindings/bainding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialservice();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Localcontroller controller = Get.put(Localcontroller());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      translations: MyTranslations(),
      theme: controller.apptheme,
      getPages: routes,
      // home: const TestScreen(),
      initialBinding: MyBinding(),
    );
  }
}
