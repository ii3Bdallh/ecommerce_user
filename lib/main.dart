import 'package:ecommere_user/bindings/intialbindings.dart';
import 'package:ecommere_user/core/localization/translation.dart';
import 'package:ecommere_user/core/services/services.dart';
import 'package:ecommere_user/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'core/localization/changelocal.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding: InitialBindings(),
      getPages: routes,
    );
  }
}
