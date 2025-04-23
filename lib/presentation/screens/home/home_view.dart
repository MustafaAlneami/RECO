import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:reco_is_here/data/models/strapi_Api_modal.dart';
import 'package:reco_is_here/data/models/test_Provider_Modal.dart';
import 'package:reco_is_here/data/models/video_card_model.dart';
import 'package:reco_is_here/data/models/video_tag_provider.dart';
import 'package:reco_is_here/data/network/api_service.dart';
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
    'Business'
  ];
  late Future<List<VideoCard>> futureCards;
  @override
  void initState() {
    super.initState();

    futureCards = ApiService().fetchVideoCards();
    final tagProvider = Provider.of<VideoTagProvider>(context, listen: false);
    tagProvider.fetchVideos();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100) {
        tagProvider.loadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //final provyModel = Provider.of<TestProviderModal>(context);
    return Scaffold(
      body: Column(
        children: [
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
          //
          //
          //
          // this  is the video  card fetch from the api
          //
          //
          FutureBuilder(
              future: futureCards,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.indigo,
                  ));
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                final cards = snapshot.data!;
                final videotagProvider =
                    Provider.of<VideoTagProvider>(context, listen: false);
                return Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: videotagProvider.videos.length +
                        (videotagProvider.isLoadingMore ? 1 : 0),
                    itemBuilder: (context, indexy) {
                      final card = cards[indexy];
                      if (indexy < videotagProvider.videos.length) {
                        final card = videotagProvider.videos[indexy];
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
                        // return Card(
                        //   child: ListTile(
                        //     title: Text(card.chanelName),
                        //     subtitle: Text('data'),
                        //     leading: Image.network(card.chanelLogo),
                        //   ),
                        // ),
                        // return HomeContentView(
                        //   chanelName: card.chanelName,
                        //   chanelsTags: card.chanelsTags,
                        //   vidTitle: card.vidTitle,
                        //   vidDuration: card.vidDuration,
                        //   vidDate: card.vidDate,
                        //   vidLink: card.vidLink,
                        //   vidDescription: card.vidDescription,
                        //   vidThumbnail: card.vidThumbnail,
                        //   chanelLogo: card.chanelLogo,
                        //   channelId: card.channelId,
                        //   vidId: card.vidId,
                        //   vidPlatform: card.vidPlatform,
                        // );
                      }
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}
