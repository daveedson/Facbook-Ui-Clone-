import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/widgets/Rooms.dart';
import 'package:flutter_facebook_responsive_ui/widgets/circleButton.dart';
import 'package:flutter_facebook_responsive_ui/widgets/createPostContainer.dart';
import 'package:flutter_facebook_responsive_ui/widgets/postContainer.dart';
import 'package:flutter_facebook_responsive_ui/widgets/responsive.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'config/palette.dart';
import 'data/data.dart';
import 'models/post_model.dart';
import 'widgets/stories.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
         mobile: _HomeScreenMobile() ,
          desktop: _HomeScreenDeskTop() ,

        ),
      ),
    );
  }
}


class _HomeScreenMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
     slivers: [
      SliverAppBar(
       brightness: Brightness.light,
       backgroundColor: Colors.white,
       title: Text(
        'facebook',
        style: TextStyle(
         color: Palette.facebookBlue,
         fontSize: 28.0,
         fontWeight: FontWeight.bold,
         letterSpacing: -1.2,
        ),
       ),
       centerTitle: false,
       floating: true,
       actions: [
        CircleButton(
         icon: Icons.search,
         iconSize: 30.0,
         onPressed: () {},
        ),
        CircleButton(
         icon: MdiIcons.facebookMessenger,
         iconSize: 30.0,
         onPressed: () {},
        )
       ],
      ),
      SliverToBoxAdapter(
       child: CreatePostContainer(
        currentUser: currentUser,
       ),
      ),
      SliverPadding(
       padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
       sliver: SliverToBoxAdapter(
        child: Rooms(onlineUsers: onlineUsers),
       ),
      ),
      SliverPadding(
       padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
       sliver: SliverToBoxAdapter(
           child: Stories(currentUser: currentUser, stories: stories)),
      ),
      SliverList(
       delegate: SliverChildBuilderDelegate(
               (context, index) {
            final Post post = posts[index];
            return PostContainer(post: post);
           },
           childCount: posts.length
       ),
      )
     ],
    );
  }
}



class _HomeScreenDeskTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
     children: [
       Flexible(
        flex: 2,
         child: Container(
          color: Colors.redAccent,
         ),
       ),
      Spacer(),
      Container(
       width: 600.0,
      child: CustomScrollView(
       slivers: [
        SliverToBoxAdapter(
         child: CreatePostContainer(
          currentUser: currentUser,
         ),
        ),
        SliverPadding(
         padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
         sliver: SliverToBoxAdapter(
          child: Rooms(onlineUsers: onlineUsers),
         ),
        ),
        SliverPadding(
         padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
         sliver: SliverToBoxAdapter(
             child: Stories(currentUser: currentUser, stories: stories)),
        ),
        SliverList(
         delegate: SliverChildBuilderDelegate(
                 (context, index) {
              final Post post = posts[index];
              return PostContainer(post: post);
             },
             childCount: posts.length
         ),
        )
       ],
      ),
      ),
      Spacer(),
      Flexible(
       flex: 2 ,
        child: Container(
         color: Colors.cyan
        ),
      )
     ],
    );
  }
}

