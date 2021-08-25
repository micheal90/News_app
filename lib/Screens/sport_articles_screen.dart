import 'package:flutter/material.dart';
import 'package:news_app/providers/sport_provider.dart';
import 'package:news_app/shared/components/widgets/article_widget.dart';
import 'package:provider/provider.dart';

class SportArticlesScreen extends StatelessWidget {
  const SportArticlesScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SportProvider>(
          builder: (context, valueSport, child) =>valueSport.isLoading? Center(child: CircularProgressIndicator(),): ListView.separated(
              itemBuilder: (context, index) => ArticleWidget(
                  title: valueSport.sportArticlesList[index].title,
                  description:
                      valueSport.sportArticlesList[index].description,
                  publishedAt:
                      valueSport.sportArticlesList[index].publishedAt,
                  imageUrl: valueSport.sportArticlesList[index].urlToImage,
                  url: valueSport.sportArticlesList[index].url,),
              separatorBuilder: (context, index) => Divider(),
              itemCount: valueSport.sportArticlesList.length)),
    );
  }
}