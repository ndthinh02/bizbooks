import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:provider/provider.dart';
import 'package:ui_flutter/bloc/audio_bloc.dart';
import 'package:ui_flutter/models/books.dart';
import 'package:ui_flutter/models/category.dart';
import 'package:ui_flutter/views/choose_category/choose_category_provider.dart';
import 'package:ui_flutter/views/splash_screen.dart';

Future<void> main() async {
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  runApp(MultiBlocProvider(
    providers: [
      ChangeNotifierProvider(
        create: ((context) => ChooseCategoryProvider()),
      ),
      ChangeNotifierProvider(
        create: ((context) => BookProvider()),
      ),
      ChangeNotifierProvider(
        create: ((context) => Category(name: '', svgPicture: '')),
      ),
      BlocProvider(
        create: (context) => AudioBlocs(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    // ]);
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        child: const SplashScreen(),
        builder: (context, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(),
              home: child);
        });
  }
}
