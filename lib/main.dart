import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/data/cache_helper.dart';
import 'package:news/network/dio_helper.dart';
import 'package:news/ui/screens/home/cubit/cubit.dart';
import 'package:news/ui/screens/home/cubit/states.dart';
import 'package:news/ui/screens/home/news_layout.dart';
import 'package:news/ui/ui_components/themes.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await CacheHelper.init();


  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => NewsCubit()..getBusinessData(),
      child: BlocConsumer<NewsCubit,NewsState>(
        listener: (context, state) {},
        builder: (context, state) {

          var cubit = NewsCubit.get(context);

          return MaterialApp(
              themeMode: cubit.isDark! ? ThemeMode.dark : ThemeMode.light,
              darkTheme: darkTheme(),
              theme: lightTheme(),
              debugShowCheckedModeBanner: false,
              home: NewsLayout()
          );
        },
      ),
    );
  }
}