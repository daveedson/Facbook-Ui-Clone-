import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profileAvatar.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  const Stories({
    Key key,
    @required this.currentUser,
    @required this.stories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + stories.length,
        itemBuilder: (BuildContext, int index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.0,
              ),
              child: _StoryCard(
                isAddStory: true,
                currentUser: currentUser,
              ),
            );
          }
          final Story story = stories[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: _StoryCard(story: story),
          );
        },
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool isAddStory;
  final User currentUser;
  final Story story;

  const _StoryCard({
    Key key,
    this.isAddStory = false,
    this.currentUser,
    this.story,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: isAddStory ? currentUser.imageUrl : story.imageUrl,
            height: double.infinity,
            width: 110.0,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 8.0,
          left: 8.0,
          child: isAddStory
              ? Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.add,
                        color: Palette.facebookBlue,
                        size: 30.0,
                      ),
                      onPressed: () {}),
                )
              : ProfileAvatar(
                  imageUrl: story.user.imageUrl,
                ),
        )
      ],
    );
  }
}
