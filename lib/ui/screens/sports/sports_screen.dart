

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/ui/screens/home/cubit/cubit.dart';
import 'package:news/ui/screens/home/cubit/states.dart';
import 'package:news/ui/ui_components/articles_list.dart';

class SportsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: BlocConsumer<NewsCubit,NewsState>(

        builder: (context, state) {

          var articles = NewsCubit.get(context).articles;

          if (state is ScienceLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is BusinessErrorState) {
            return Center(child: Text("Error loading data"));
          } else if (articles.isEmpty) {
            return Center(child: Text("No articles found"));
          }

          return articlesList(articles);

        },
        listener: (context, state) {

        },),
    );
  }
}