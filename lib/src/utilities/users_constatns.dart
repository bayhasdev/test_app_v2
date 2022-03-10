import 'dart:math';

import 'package:test_app_v2/src/utilities/models/user_model.dart';
import 'package:username_gen/username_gen.dart';

List<UserModle> generateUsers({count = 10}) {
  var imageType = ['women', 'men'];
  List<UserModle> list = [];
  Random random = Random();
  for (var i = 0; i < count; i++) {
    list.add(
      UserModle(
        id: random.nextInt(99999),
        name: UsernameGen().generate(),
        photo: 'https://randomuser.me/portraits/${imageType[random.nextInt(2)]}/${random.nextInt(100)}.jpg',
        //   photo: 'https://placeimg.com/128/128/people',
      ),
    );
  }
  return list;
}
