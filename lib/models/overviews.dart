const String overviewJson = '''
  [
    {
        "channel":"Fashion",
        "cover_image":"assets/images/cb2.png",
        "followers_count":"145k",
        "articles_count":"128k",
        "proportion": 34
    },
    {
        "channel":"Enviroment",
        "cover_image":"assets/images/cb4.png",
        "followers_count":"678k",
        "articles_count":"239k",
        "proportion": 56
    },
    {
        "channel":"Tehnology",
        "cover_image":"assets/images/cb3.png",
        "followers_count":"289k",
        "articles_count":"753k",
        "proportion": 19
    },
    {
        "channel":"Science",
        "cover_image":"assets/images/cb1.png",
        "followers_count":"234k",
        "articles_count":"496k",
        "proportion": 28
    }
  ]
  ''';

class OverviewModel {
  String title;
  String coverImage;
  String articlesCount;
  String followersCount;
  int proportion;

  OverviewModel({
    this.title,
    this.coverImage,
    this.articlesCount,
    this.followersCount,
    this.proportion,
  });

  OverviewModel.fromJson(Map<String, dynamic> data) {
    title = data['channel'];
    coverImage = data["cover_image"];
    articlesCount = data["articles_count"];
    followersCount = data["followers_count"];
    proportion = data["proportion"];
  }
}
