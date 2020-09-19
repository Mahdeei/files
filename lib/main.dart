import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stubbbb/Other/SizeConfig.dart';
import 'LoginPage/SplashScreen.dart';

void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LayoutBuilder(
          builder: (context,constraints){
            return OrientationBuilder(
                builder: (context,orientation){
                  SizeConfig().init(constraints, orientation);
                  return new SafeArea(
                      top: true,
                      bottom: true,
                      child: new Directionality(textDirection: TextDirection.rtl, child: new SplashScreen()));
                }

            );
          },
        )
    );
  }
}
