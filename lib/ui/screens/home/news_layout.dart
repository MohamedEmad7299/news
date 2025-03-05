
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/ui/screens/home/cubit/cubit.dart';
import 'package:news/ui/screens/home/cubit/states.dart';
import 'package:news/ui/screens/search/search_screen.dart';


class NewsLayout extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,NewsState>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context, SearchScreen());
                },
                icon: Icon(
                    Icons.search
                ),
              ),
              IconButton(
                onPressed: () {
                  cubit.changeThemeMode();
                },
                icon: Icon(
                    Icons.brightness_4_outlined
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.business_center,
                  ),
                  label: 'Business'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.sports,
                  ),
                  label: 'Sports'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.science,
                  ),
                  label: 'Science')
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}

void navigateTo(context, widget) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}