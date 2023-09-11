import 'dart:typed_data';
import 'package:domus_buddies/services/as_minhas_publicacoes_service.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:domus_buddies/domain/post_info.dart';
import 'package:domus_buddies/services/feed_services.dart';
import 'package:domus_buddies/uploadPage.dart';
import 'package:domus_buddies/user_info.dart';
import 'package:provider/provider.dart';
import 'background/AppBarGeneric.dart';
import 'background/BackgroundGeneric.dart';
import 'User/get_keycloack_token.dart';
import 'package:video_player/video_player.dart';
import 'services/dog_picture_api.dart';

class AsMinhasPublicacoes extends StatelessWidget {
  const AsMinhasPublicacoes({super.key});

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
      create: (context) => AsMinhasPubliccoesService(),
      child: Scaffold(
        appBar: CustomAppBar(),
        body: Consumer<AsMinhasPubliccoesService>(builder: (context, provider, child) {
          List<PostInfo> feeds = provider.feeds;
          if (feeds.isEmpty) {
            provider.fetchFeed(authToken as String, username!);
            return buildFunnyAnimation(feeds); // Show loading GIF
          } else {
            return buildFeedList(context, feeds);
          }
        }),
      ),
    );
  }

  Widget buildFeedList(BuildContext context, List<PostInfo> feeds) {
    return Stack(
      children: [
        GradientBackground(
          child: Container(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  ' Novidades',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                    fontFamily: 'Handwritten',
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: feeds.length, // Add two for the loading animation and DogPictureApi widget
                    itemBuilder: (context, index) {
                      /*if (index == 0) {
                        return buildFunnyAnimation(feeds); // Display the funny animation at the top
                      } else if (index == 1) {
                        //return DogPictureApi(); // Display the DogPictureApi widget
                      } else {*/
                      return buildPostSection(context, feeds.elementAt(index));
                      //}
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 16, // adjust as needed
          right: 16, // adjust as needed
          child: FloatingActionButton(
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
      ],
    );
  }

  Widget buildPostSection(BuildContext context, PostInfo post) {
    return buildMediaSection(context, post);
  }

/*  Widget buildMedia(BuildContext context, PostInfo post) {
    const url = 'https://domusbuddies.s3.eu-central-1.amazonaws.com/';
    if (post.filename != null) {
      try {
        if (post.mimeType == FileType.image) {
          // Display image
      return Image.network(url + post.filename!);
      } else if (post.mimeType == FileType.video) {
          // Display video using ChewieController
          final videoController = VideoPlayerController.asset(
            'assets/video.mp4', // Replace with your video asset
          );
        final chewieController = ChewieController(
            videoPlayerController: videoController,
            autoPlay: false, // Adjust autoplay as needed
            looping: false, // Adjust looping as needed
          );

          return Chewie(controller: chewieController);
    }
      } catch (e) {
        print('Error loading media: $e');
      }
  }
  // Handle the case where media data is empty or invalid.
  return PlaceholderImage();
}*/

  Widget buildMedia(BuildContext context, PostInfo post) {
    if (post.filename != null) {
      var url = ('https://domusbuddies.s3.eu-central-1.amazonaws.com/${post.filename!}');
      return Image.memory(Uint8List.fromList(post.fileInBytes));
    }
    return PlaceholderImage();
  }

  Widget buildMediaSection(BuildContext context, PostInfo post) {
    return Card(
      color: Colors.transparent, // Make the card transparent
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.white.withOpacity(0.5), // Change this color to whatever you like
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
                    '${post.userLiked!.length}',
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
                onTap: () {
                  // Handle comment tap if needed
                },
              );
            },
          ),
        );
      },
    );
  }

  Widget buildFunnyAnimation(List<PostInfo> feeds) {
    // Determine which GIF to display based on whether there are any feeds.
    String gifAsset;
    if (feeds.isEmpty) {
      gifAsset = 'assets/Gif/cat.gif'; // Display loading GIF
    } else {
      gifAsset = 'assets/Gif/cat.gif'; // Display cat GIF when there are feeds
    }

    return Stack(
      children: [
        // Background image with stars
        Image.asset(
          'assets/images/night.jpg', // Replace with your night sky background image path
          fit: BoxFit.cover, // Ensure the background image covers the entire screen
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
  const PlaceholderImage({Key? key});

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
