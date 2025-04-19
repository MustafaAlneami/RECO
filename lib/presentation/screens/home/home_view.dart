import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reco_is_here/data/models/strapi_Api_modal.dart';
import 'package:reco_is_here/data/models/test_Provider_Modal.dart';
import 'package:reco_is_here/data/models/video_card_model.dart';
import 'package:reco_is_here/data/network/api_service.dart';
import 'package:reco_is_here/presentation/screens/home/widgets/home_content_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  late Future<List<VideoCard>> futureCards;
  @override
  void initState() {
    super.initState();

    futureCards = ApiService().fetchVideoCards();
  }

  @override
  Widget build(BuildContext context) {
    //final provyModel = Provider.of<TestProviderModal>(context);
    return Scaffold(
      body: FutureBuilder(
          future: futureCards,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            final cards = snapshot.data!;
            return ListView.builder(
                itemCount: cards.length,
                itemBuilder: (context, indexy) {
                  final card = cards[indexy];

                  // return Card(
                  //   child: ListTile(
                  //     title: Text(card.chanelName),
                  //     subtitle: Text('data'),
                  //     leading: Image.network(card.chanelLogo),
                  //   ),
                  // ),
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
                });
          }),
    );
  }
}
