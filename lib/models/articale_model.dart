class Article {
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;

  Article({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> jsonData) {
    return Article(
      title: jsonData['title'],
      description: jsonData['description']??'',
      url: jsonData['url'],
      urlToImage: jsonData['urlToImage']??'https://i.stack.imgur.com/y9DpT.jpg',
      publishedAt: jsonData['publishedAt']??'',
    );
  }
}
