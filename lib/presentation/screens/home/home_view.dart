//
//
//
//
//this the the neww
//this the the neww
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:reco_is_here/data/models/video_card_model.dart';
import 'package:reco_is_here/data/models/video_tag_provider.dart';
import 'package:reco_is_here/presentation/screens/home/widgets/home_content_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  final ScrollController _scrollController = ScrollController();
  final List<String> tags = [
    'All',
    'Vlogs',
    'Entertainment',
    'Coding',
    'Business',
    'Travel' // Added this since your example JSON had "Travel"
  ];

  @override
  void initState() {
    super.initState();
    // Initialize video fetching
    Future.microtask(() {
      Provider.of<VideoTagProvider>(context, listen: false).fetchVideos();
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100) {
        Provider.of<VideoTagProvider>(context, listen: false).loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //  physics: const BouncingScrollPhysics(),
        children: [
          // Tag filtering buttons
          Consumer<VideoTagProvider>(
              builder: (context, videotagProvider, child) {
            return Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: tags.map((tag) {
                      final isSelected = videotagProvider.selectedTag == tag;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                isSelected ? Colors.indigo : Colors.pink[100],
                          ),
                          onPressed: () => videotagProvider.filterByTag(tag),
                          child: Text(tag,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                              )),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            );
          }),

          // Videos list
          Consumer<VideoTagProvider>(
            builder: (context, videotagProvider, child) {
              if (videotagProvider.isLoading) {
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(color: Colors.indigo),
                  ),
                );
              }

              if (videotagProvider.videos.isEmpty) {
                return Expanded(
                  child: Center(
                    child: Text(
                        "No videos found with tag: ${videotagProvider.selectedTag}"),
                  ),
                );
              }

              return Expanded(
                child: RefreshIndicator(
                  onRefresh: () => videotagProvider.refreshVideos(),
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: videotagProvider.videos.length +
                        (videotagProvider.isLoadingMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index < videotagProvider.videos.length) {
                        final card = videotagProvider.videos[index];
                        return HomeContentView(
                          chanelName: card.chanelName,
                          chanelsTags: card.chanelsTags,
                          vidTitle: card.vidTitle,
                          vidDuration: card.vidDuration,
                          vidDate: card.vidDate,
                          vidLink: card.vidLink,
                          vidDescription: card.vidDescription,
                          vidThumbnail: card.vidThumbnail,
                          chanelLogo: card.chanelLogo,
                          channelId: card.channelId,
                          vidId: card.vidId,
                          vidPlatform: card.vidPlatform,
                        );
                      } else {
                        return const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
