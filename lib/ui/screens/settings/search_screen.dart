
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/ui/screens/home/cubit/cubit.dart';
import 'package:news/ui/screens/home/cubit/states.dart';
import 'package:news/ui/ui_components/articles_list.dart';
import 'package:news/ui/ui_components/defaultFormField.dart';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var searchController = TextEditingController();

    return BlocConsumer<NewsCubit,NewsState>(
      listener: (context, state) {

      },
      builder: (BuildContext context, state) {

        var cubit = NewsCubit.get(context);

        return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: defaultFormField(
                    controller: searchController,
                    type: TextInputType.text,
                    validate: (value) {

                      if (value.isEmpty) {
                        return 'search must not be empty';
                      }
                      return null;
                    },
                    onChange: (value) {
                      cubit.search(value);
                    },
                    label: 'Search',
                    prefixIcon: Icons.search,
                    onSubmit: (String text) {
                      print(text);
                    },
                  ),
                ),
                Expanded(
                    child: articlesList(cubit.searchList)
                )
              ],
            )
        );
      },
    );
  }
}