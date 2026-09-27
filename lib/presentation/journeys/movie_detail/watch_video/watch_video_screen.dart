import 'package:movie/l10n/app_localizations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie/common/constants/size_constants.dart';
import 'package:movie/domain/enities/video_entity.dart';
import 'package:movie/presentation/journeys/movie_detail/watch_video/watch_video_arguments.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';


import '../../../themes/app_color.dart';



class WatchVideoScreen extends StatefulWidget {
  final WatchVideoArguments watchVideoArguments;

  const WatchVideoScreen({
    Key? key,
    required this.watchVideoArguments,
  }) : super(key: key);

  @override
  _WatchVideoScreenState createState() => _WatchVideoScreenState();
}

class _WatchVideoScreenState extends State<WatchVideoScreen> {
  late List<VideoEntity> _videos;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _videos = widget.watchVideoArguments.videos;
    _controller = YoutubePlayerController(
      initialVideoId: _videos[0].key,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void playVideo(int index) {
    _controller.load(_videos[index].key);
    _controller.play();
  }

  void stopVideo() {
    _controller.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.vulcan,
        title:Text(
          AppLocalizations.of(context)!.watchTrailers,
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // Set the back button color to white
        ),
      ),
      body: Column(
        children: [
          YoutubePlayer(
            controller: _controller,
            aspectRatio: 16 / 9,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.amber,
            progressColors: ProgressBarColors(
              playedColor: Colors.amber,
              handleColor: Colors.amberAccent,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < _videos.length; i++)
                    GestureDetector(
                      onTap: () => playVideo(i),
                      child: Container(
                        height: 60,
                        padding: EdgeInsets.symmetric(vertical: Sizes.dimen_8),
                        child: Row(
                          children: <Widget>[
                            CachedNetworkImage(
                              width: Sizes.dimen_200,
                              imageUrl: YoutubePlayer.getThumbnail(
                                videoId: _videos[i].key,
                                quality: ThumbnailQuality.high,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  _videos[i].title,
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}