const String data = '''
[
    {
        "title":"Astronauts could land on Red Planet by 2039",
        "author":"SPACE.com",
        "create_time":"20m ago",
        "channel":"SCIENCE",
        "cover_image":"assets/images/b1.png"
    },
    {
        "title":"Arctic sea ice extent hits record low for winter maximum",
        "author":"CNN",
        "create_time":"1h ago",
        "channel":"ENVIROMENT",
        "cover_image":"assets/images/b2.png"
    },
    {
        "title":"New battery for smartphones can be charged in a minute",
        "author":"Reuters",
        "create_time":"6h ago",
        "channel":"TECNOLOGY",
        "cover_image":"assets/images/b3.png"
    },
    {
        "title":"So what does this new record for the lowest level of winter ice actually mean?",
        "author":"MEET NOW",
        "create_time":"3h ago",
        "channel":"ENVIROMENT",
        "cover_image":"assets/images/b4.png"
    },
    {
        "title":"Archaeologists discovered lost city in Honduran jungle",
        "author":"CNN",
        "create_time":"9m ago",
        "channel":"NATURE",
        "cover_image":"assets/images/b5.png"
    }
]
''';

class TopicModel {
  String title;
  String author;
  String channel;
  String createTime;
  String coverImage;

  TopicModel(
      {this.title,
      this.author,
      this.channel,
      this.createTime,
      this.coverImage});

  factory TopicModel.fromJson(Map<String, dynamic> json) {
    return TopicModel(
      title: json['title'],
      author: json['author'],
      channel: json['channel'],
      createTime: json['create_time'],
      coverImage: json['cover_image'],
    );
  }

  @override
  String toString() {
    return "title: $title, author: $author, channel: $channel, create_time: $createTime, cover_image: $coverImage";
  }
}
