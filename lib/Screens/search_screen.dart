import 'package:flutter/material.dart';
import 'package:news_app/providers/search_provider.dart';
import 'package:news_app/shared/components/widgets/article_widget.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 5),
        child: Consumer<SearchProvider>(
          builder: (context, valueSearch, child) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                controller: searchController,
                keyboardType: TextInputType.text,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  labelText: 'Search',
                  labelStyle: TextStyle(color: Colors.black54),

                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),

                  //contentPadding: EdgeInsets.all(10),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                ),
                onChanged: (String? value) =>
                    valueSearch.fetchSerachArticles(value!),
              ),
              Expanded(
                  child: valueSearch.isLoading
                      ? CircularProgressIndicator()
                      : ListView.separated(
                          itemBuilder: (context, index) => ArticleWidget(
                                title: valueSearch.articles[index].title,
                                description:
                                    valueSearch.articles[index].description,
                                publishedAt:
                                    valueSearch.articles[index].publishedAt,
                                imageUrl:
                                    valueSearch.articles[index].urlToImage,
                                url: valueSearch.articles[index].url,
                              ),
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: valueSearch.articles.length))
            ],
          ),
        ),
      ),
    );
  }
}
