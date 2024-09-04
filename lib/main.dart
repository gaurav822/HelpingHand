import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:helpinghand/data/repositories/expert/expert_repository.dart';
import 'package:helpinghand/features/authentication/controllers/login/login_controller.dart';
import 'Utils/securestorage/secure_storage_service.dart';
import 'bindings/general_bindings.dart';
import 'core/app_theme.dart';
import 'core/colors/light_theme_color.dart';
import 'data/repositories/authentication/authentication_repository.dart';


Future<void> main() async{
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white
  ));

  //Widgets binding
  final widgetBinding = WidgetsFlutterBinding.ensureInitialized();

  // Get-x Local storage
  await GetStorage.init();

  //await splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);
  Get.put(SecureStorageService());
  Get.put(LoginController());
  Get.put(AuthenticationRepository());
  Get.put(ExpertRepository());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightAppTheme,
      initialBinding: GeneralBindings(),
      home: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        child: Scaffold(backgroundColor: LightThemeColor.colorPrimary,
          body: const Center(child: CircularProgressIndicator(color: Colors.white,),),),
      ),
      // home: const ScreenUtilInit(
      //     designSize: Size(390, 844),
      //     minTextAdapt: true,
      //     splitScreenMode: true,
      //     child:  OnBoardingScreen()),
    );
  }
}
