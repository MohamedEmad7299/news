

import 'package:flutter/cupertino.dart';
import 'package:news/ui/ui_components/grey_divider.dart';
import 'package:news/ui/ui_components/news_item.dart';

Widget articlesList(List<dynamic> articles) => ListView.separated(
  physics: BouncingScrollPhysics(),
  separatorBuilder: (context, index) => greyDivider(),
  itemBuilder: (context, index) {

    return buildArticleItem(articles[index]);
  },
  itemCount: articles.length,
);