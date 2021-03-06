import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/user_model.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profileAvatar.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({
    Key key,
    this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap: (){},
      child: Row(
       mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(imageUrl: user.imageUrl),
          SizedBox(width: 6.0),
          Text(
            user.name,
            style: TextStyle(fontSize: 16.0),
          )
        ],
      ),
    );
  }
}
