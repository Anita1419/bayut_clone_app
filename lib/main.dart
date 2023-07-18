import 'package:bayut_clone_app/firebase_options.dart';
import 'package:bayut_clone_app/provider/searchfilterlistprovider.dart';
import 'package:bayut_clone_app/route.dart';
import 'package:bayut_clone_app/screens/splash_screen.dart';
import 'package:bayut_clone_app/services/firebaseHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        // ChangeNotifierProvider<RentAndBuyProvider>(
        //   create: (_) => RentAndBuyProvider(),
        // ),
        ChangeNotifierProvider<SearchFilterListProvider>(
          create: (_) => SearchFilterListProvider(),
        ),
        Provider<FirebaseAuthHelper>(
          create: (_) => FirebaseAuthHelper(FirebaseAuth.instance),
        ),
        StreamProvider(
            create: (context) => context.read<FirebaseAuthHelper>().authState,
            initialData: null)
      ],
      child: GetMaterialApp(home: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  //final Controller1 controller1 = Get.put(Controller1());

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            sliderTheme: const SliderThemeData(
                activeTickMarkColor: Colors.amber,
                inactiveTickMarkColor: Colors.black)),
        home: const SplashScreen(),
        onGenerateRoute: AppRouter.onNavigate,
      );
    });
  }
}
