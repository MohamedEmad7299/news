
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/data/cache_helper.dart';
import 'package:news/network/dio_helper.dart';
import 'package:news/ui/screens/business/business_screen.dart';
import 'package:news/ui/screens/home/cubit/states.dart';
import 'package:news/ui/screens/science/science_screen.dart';
import 'package:news/ui/screens/settings/settings_screen.dart';
import 'package:news/ui/screens/sports/sports_screen.dart';

class NewsCubit extends Cubit<NewsState>{

  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];

  void changeIndex(int index) {

    currentIndex = index;
    getBusinessData();
    emit(NewsBottomNavState());
  }

  List<dynamic> articles = [];

  List<String> categories = ['business','sports','science'];

  void getBusinessData() {

    emit(BusinessLoadingState());

    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': categories[currentIndex],
          'apiKey': '49f4c18d98bd457dbdd46684642f6703'
        }
    ).then((value) {
      articles = value.data['articles'];
      emit(BusinessSuccessState());
    },).catchError((error) {
      print(error.toString());
      emit(BusinessErrorState(error.toString()));
    });
  }

  bool? isDark = CacheHelper.getData(key: 'themeMode') ?? false;

  void changeThemeMode() {

    isDark = !isDark!;
    CacheHelper.setData(key: 'themeMode', value: isDark!).then((value) {
      emit(ThemeModeState());
    },);
  }
}