import 'package:now_app/models/users.dart';

const String channelsJson = '''
  [
    {
        "channel":"Science",
        "cover_image":"assets/images/cb1.png",
        "follows":"234k",
        "head_followers":[
            {
                "name": "August5th",
                "avatar":"https://avatars0.githubusercontent.com/u/507615?s=40&v=4"
            },
            {
                "name": "Sett",
                "avatar":"https://avatars3.githubusercontent.com/u/29775873?s=40&v=4"
            },
            {
                "name": "Bob",
                "avatar":"https://avatars2.githubusercontent.com/u/7017767?s=40&v=4"
            },            
            {
                "name": "Rugust5th",
                "avatar":"https://avatars0.githubusercontent.com/u/7971415?s=40&v=4"
            },
            {
                "name": "Fett",
                "avatar":"https://avatars1.githubusercontent.com/u/28616219?s=40&v=4"
            }
        ]
    },
    {
        "channel":"Fashion",
        "cover_image":"assets/images/cb2.png",
        "follows":"145k",
        "head_followers":[
            {
                "name": "Eugust5th",
                "avatar":"https://avatars3.githubusercontent.com/u/8358236?s=40&v=4"
            },
            {
                "name": "Jett",
                "avatar":"https://avatars1.githubusercontent.com/u/6828924?s=40&v=4"
            },
            {
                "name": "Pob",
                "avatar":"https://avatars3.githubusercontent.com/u/5378891?s=40&v=4"
            },
            {
                "name": "Rugust5th",
                "avatar":"https://avatars0.githubusercontent.com/u/7971415?s=40&v=4"
            },
            {
                "name": "Fett",
                "avatar":"https://avatars1.githubusercontent.com/u/28616219?s=40&v=4"
            }
        ]
    },
    {
        "channel":"Tehnology",
        "cover_image":"assets/images/cb3.png",
        "follows":"289k",
        "head_followers":[
            {
                "name": "AWugust5th",
                "avatar":"https://avatars3.githubusercontent.com/u/465125?s=40&v=4"
            },
            {
                "name": "Qett",
                "avatar":"https://avatars1.githubusercontent.com/u/8186664?s=40&v=4"
            },
            {
                "name": "Job",
                "avatar":"https://avatars0.githubusercontent.com/u/13673257?s=40&v=4"
            },            
            {
                "name": "August5th",
                "avatar":"https://avatars0.githubusercontent.com/u/507615?s=40&v=4"
            },
            {
                "name": "Sett",
                "avatar":"https://avatars3.githubusercontent.com/u/29775873?s=40&v=4"
            }
        ]
    },
    {
        "channel":"Enviroment",
        "cover_image":"assets/images/cb4.png",
        "follows":"678k",
        "head_followers":[
            {
                "name": "Ougust5th",
                "avatar":"https://avatars3.githubusercontent.com/u/5526096?s=40&v=4"
            },
            {
                "name": "Rett",
                "avatar":"https://avatars3.githubusercontent.com/u/7843281?s=40&v=4"
            },
            {
                "name": "August5th",
                "avatar":"https://avatars0.githubusercontent.com/u/507615?s=40&v=4"
            },
            {
                "name": "Sett",
                "avatar":"https://avatars3.githubusercontent.com/u/29775873?s=40&v=4"
            },
            {
                "name": "Kob",
                "avatar":"https://avatars3.githubusercontent.com/u/7504237?s=40&v=4"
            }
        ]
    },
    {
        "channel":"Finance",
        "cover_image":"assets/images/cb2.png",
        "follows":"331k",
        "head_followers":[
            {
                "name": "Jett",
                "avatar":"https://avatars1.githubusercontent.com/u/6828924?s=40&v=4"
            },
            {
                "name": "Pob",
                "avatar":"https://avatars3.githubusercontent.com/u/5378891?s=40&v=4"
            },
            {
                "name": "Rugust5th",
                "avatar":"https://avatars0.githubusercontent.com/u/7971415?s=40&v=4"
            },
            {
                "name": "Fett",
                "avatar":"https://avatars1.githubusercontent.com/u/28616219?s=40&v=4"
            },
            {
                "name": "Dob",
                "avatar":"https://avatars2.githubusercontent.com/u/7017768?s=40&v=4"
            }
        ]
    },
    {
        "channel":"Nature",
        "cover_image":"assets/images/cb1.png",
        "follows":"278k",
        "head_followers":[
            {
                "name": "Cugust5th",
                "avatar":"https://avatars2.githubusercontent.com/u/7017769?s=40&v=4"
            },
            {
                "name": "Lett",
                "avatar":"https://avatars2.githubusercontent.com/u/3017768?s=40&v=4"
            },
            {
                "name": "Sob",
                "avatar":"https://avatars2.githubusercontent.com/u/4717767?s=40&v=4"
            },
            {
                "name": "Jett",
                "avatar":"https://avatars1.githubusercontent.com/u/6828924?s=40&v=4"
            },
            {
                "name": "Pob",
                "avatar":"https://avatars3.githubusercontent.com/u/5378891?s=40&v=4"
            }
        ]
    }
  ]
  ''';

class ChannelModel {
  String channel;
  String coverImage;
  String follows;
  List<UserModel> headFollowers;

  ChannelModel(
    this.channel,
    this.coverImage,
    this.follows,
    this.headFollowers,
  );

  ChannelModel.fromJson(Map<String, dynamic> data) {
    channel = data['channel'];
    coverImage = data['cover_image'];
    follows = data['follows'];
    List<dynamic> hf = data["head_followers"];
    headFollowers = hf.map((e) => UserModel.fromJson(e)).toList();
  }
}
