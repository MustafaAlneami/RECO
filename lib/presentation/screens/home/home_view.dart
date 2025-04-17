import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reco_is_here/data/models/test_Provider_Modal.dart';
import 'package:reco_is_here/presentation/screens/home/widgets/home_content_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    //final provyModel = Provider.of<TestProviderModal>(context);
    return Scaffold(
      // body:
      // Column(
      //   children: [
      //     Consumer<TestProviderModal>(
      //         builder: (context, testProviderModal, child) {
      //       return Column(
      //         children: [
      //           Text("${testProviderModal.age}"),
      //         ],
      //       );
      //     }),
      //     IconButton(
      //         onPressed: () {
      //           context.read()<TestProviderModal>().incremento();
      //         },
      //         icon: Icon(Icons.add))
      //   ],
      // ),
      body: HomeContentView(),
    );
  }
}
