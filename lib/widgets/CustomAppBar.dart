import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/user_model.dart';

class CustomAppBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final User currentUser;

  const CustomAppBar({
    Key key,
  @required  this.icons,
   @required   this.selectedIndex,
   @required   this.onTap,
   @required   this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
