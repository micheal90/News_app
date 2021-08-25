import 'package:flutter/material.dart';
import 'package:news_app/providers/technology_provider.dart';
import 'package:news_app/shared/components/widgets/article_widget.dart';
import 'package:provider/provider.dart';

class TechnologyArticlesScreen extends StatelessWidget {
  const TechnologyArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TechnologyProvider>(
          builder: (context, valueTech, child) => valueTech.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  itemBuilder: (context, index) => ArticleWidget(
                        title: valueTech.technologyArticlesList[index].title,
                        description:
                            valueTech.technologyArticlesList[index].description,
                        publishedAt:
                            valueTech.technologyArticlesList[index].publishedAt,
                        imageUrl:
                            valueTech.technologyArticlesList[index].urlToImage,
                        url: valueTech.technologyArticlesList[index].url,
                      ),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: valueTech.technologyArticlesList.length)),
    );
  }
}
