import 'package:flutter/material.dart';
import 'package:news_app/providers/business_provider.dart';
import 'package:news_app/shared/components/widgets/article_widget.dart';
import 'package:provider/provider.dart';

class BusinessArticlesScreen extends StatelessWidget {
  const BusinessArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BusinessProvider>(
        builder: (context, valueBusiness, child) =>valueBusiness.isLoading? Center(child: CircularProgressIndicator(),):ListView.separated(
            itemBuilder: (context, index) => ArticleWidget(
                title: valueBusiness.businessArticlesList[index].title,
                description:
                    valueBusiness.businessArticlesList[index].description,
                publishedAt:
                    valueBusiness.businessArticlesList[index].publishedAt,
                imageUrl: valueBusiness.businessArticlesList[index].urlToImage,
                url: valueBusiness.businessArticlesList[index].url,
                ),
                
            separatorBuilder: (context, index) => Divider(),
            itemCount: valueBusiness.businessArticlesList.length),
      ),
    );
  }
}
