
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/Screens/webview_screen.dart';

class ArticleWidget extends StatelessWidget {
  final imageUrl;
  final String title, description, publishedAt, url;

  const ArticleWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.publishedAt,
      required this.imageUrl,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => WebViewScreen(
                url: url,
                title: title,
                
              ))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: NetworkImage(imageUrl), fit: BoxFit.fill)),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyText2,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      DateFormat.yMMMMd().format(DateTime.parse(publishedAt)),
                      style: TextStyle(color: Colors.grey.shade500),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
