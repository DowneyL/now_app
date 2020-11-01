const String data = '''
[
    {
        "title":"Astronauts could land on Red Planet by 2039",
        "author":"SPACE.com",
        "create_time":"20m ago",
        "category":"SCIENCE",
        "cover_image":"assets/images/b1.png"
    },
    {
        "title":"Arctic sea ice extent hits record low for winter maximum",
        "author":"CNN",
        "create_time":"1h ago",
        "category":"ENVIROMENT",
        "cover_image":"assets/images/b2.png"
    },
    {
        "title":"New battery for smartphones can be charged in a minute",
        "author":"Reuters",
        "create_time":"6h ago",
        "category":"TECNOLOGY",
        "cover_image":"assets/images/b3.png"
    },
    {
        "title":"So what does this new record for the lowest level of winter ice actually mean?",
        "author":"MEET NOW",
        "create_time":"3h ago",
        "category":"ENVIROMENT",
        "cover_image":"assets/images/b4.png"
    },
    {
        "title":"Archaeologists discovered lost city in Honduran jungle",
        "author":"CNN",
        "create_time":"9m ago",
        "category":"NATURE",
        "cover_image":"assets/images/b5.png"
    }
]
''';

class TopicModel {
  String title;
  String author;
  String category;
  String createTime;
  String coverImage;

  TopicModel(
      {this.title,
      this.author,
      this.category,
      this.createTime,
      this.coverImage});

  factory TopicModel.fromJson(Map<String, dynamic> json) {
    return TopicModel(
      title: json['title'],
      author: json['author'],
      category: json['category'],
      createTime: json['create_time'],
      coverImage: json['cover_image'],
    );
  }

  @override
  String toString() {
    return "title: $title, author: $author, category: $category, create_time: $createTime, cover_image: $coverImage";
  }
}
