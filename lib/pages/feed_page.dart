import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:domus_buddies/services/post_info.dart';
import 'package:domus_buddies/services/feed_services.dart';
import 'package:domus_buddies/pages/upload_page.dart';
import 'package:domus_buddies/User/user_info.dart';
import 'package:provider/provider.dart';
import '../background/appbar_generic.dart';
import '../background/background_generic.dart';
import '../User/get_keycloack_token.dart';

class NovidadesPage extends StatelessWidget {
  const NovidadesPage({super.key,});

  Widget buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final username = UserSession.loggedInUsername;
    final accessTokenProvider = Provider.of<FetchUserData>(context, listen: false);
    final authToken = accessTokenProvider.accessToken;

    return ChangeNotifierProvider(
      create: (context) => FeedServices(),
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Consumer<FeedServices>(builder: (context, provider, child) {
          List<PostInfo> feeds = provider.feeds;
          if (feeds.isEmpty) {
            provider.fetchFeed(authToken as String, 30, 0);
            return buildFunnyAnimation(feeds);
          } else {
            return buildFeedList(context, feeds);
          }
        }),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink,
          elevation: 5.0,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UploadPage()),
            );
          },
          child: const Icon(Icons.add_a_photo_outlined, color: Colors.white),
        ),
      ),
    );
  }

  Widget buildFeedList(BuildContext context, List<PostInfo> feeds) {
    double screenWidth = MediaQuery.of(context).size.width;
    double titleFontSize = screenWidth < 600 ? 30.0 : 60.0; // Adjust the values as needed

    return GradientBackground(
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              ' Novidades',
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
                fontFamily: 'Handwritten',
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: feeds.length,
                itemBuilder: (context, index) {
                  return buildPostSection(context, feeds.elementAt(index));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget buildPostSection(BuildContext context, PostInfo post) {
    return buildMediaSection(context, post);
  }

  Widget buildMedia(BuildContext context, PostInfo post) {
    if (post.filename != null) {
      var url = ('https://domusbuddies.s3.eu-central-1.amazonaws.com/${post.filename!}');
      return Image.memory(Uint8List.fromList(post.fileInBytes));
    }
    return const PlaceholderImage();
  }

  Widget buildMediaSection(BuildContext context, PostInfo post) {
    return Card(
      color: Colors.transparent,
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.white.withOpacity(0.5),
            width: 1.5,
          ),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: buildMedia(context, post),
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: Row(
                children: [
                  const Icon(Icons.favorite_outline_sharp, color: Colors.pink),
                  const SizedBox(width: 4),
                  Text(
                    '${post.userLiked.length}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    icon: const Icon(Icons.comment_outlined, color: Colors.pink),
                    onPressed: () {
                      _showListBottomSheet(context, post.comments);
                    },
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${post.comments.length}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showListBottomSheet(BuildContext context, List<CommentInfo> comments) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.pink,
          child: ListView.builder(
            itemCount: comments.length,
            itemBuilder: (BuildContext context, int index) {
              String comment = comments.elementAt(index).message;
              return ListTile(
                tileColor: Colors.white,
                title: Text(
                  comment,
                  style: const TextStyle(color: Colors.white),
                ),
                onTap: () {},
              );
            },
          ),
        );
      },
    );
  }

  Widget buildFunnyAnimation(List<PostInfo> feeds) {
    String gifAsset;
    if (feeds.isEmpty) {
      gifAsset = 'assets/Gif/cat.gif';
    } else {
      gifAsset = 'assets/Gif/cat.gif';
    }

    return Stack(
      children: [
        Image.asset(
          'assets/images/garden.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        // Loading GIF
        Center(
          child: Image.asset(
            gifAsset,
            height: 200,
          ),
        ),
      ],
    );
  }
}

class PlaceholderImage extends StatelessWidget {
  const PlaceholderImage({super.key,});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.image,
      size: 150,
      color: Colors.pink,
    );
  }
}

enum FileType {
  image,
  video,
  unknown,
}
