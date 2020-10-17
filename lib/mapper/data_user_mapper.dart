import 'package:flutter_setup_app/data/entity/user_entity.dart';
import 'package:flutter_setup_app/presentation/model/user.dart';

import 'mapper.dart';

class DataUserMapper extends Mapper<UserEntity, User> {
  @override
  map(from) {
    return User(
        id: from.id,
        name: from.name,
        username: from.username,
        email: from.email,
        phone: from.phone);
  }
}
