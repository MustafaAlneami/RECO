import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reco_is_here/presentation/screens/calender/calender_view.dart';
import 'package:reco_is_here/presentation/screens/home/home_view.dart';
import 'package:reco_is_here/presentation/screens/reco/reco_view.dart';
import 'package:reco_is_here/presentation/screens/setting/setting_view.dart';
import 'main_view_model.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  final List<Widget> _pages = const [
    HomeView(),
    CalendarView(),
    RecoView(),
    SettingView(),
  ];

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MainViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Colors.indigo,
        ),
        title: const Text('RECO ',
            style:
                TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold)),
        // backgroundColor: Colors.white70, // light pink
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.indigo),
            onPressed: () {
              // Your action here
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: viewModel.currentIndex,
        children: _pages,
      ),
      floatingActionButton: FloatingActionButton(
        //light pink
        //pinky colour
        backgroundColor: const Color(0xFFF8BBD0), // light pink
        onPressed: () {
          // Your action here
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // 👇 Using BottomAppBar instead of BottomNavigationBar
      //remember to add the notch margin to the bottom app bar
      //tested with a circular notch
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.home,
                  size: 30,
                ),
                color:
                    viewModel.currentIndex == 0 ? Colors.indigo : Colors.black,
                onPressed: () => viewModel.changePage(0),
              ),
              // Space for the FAB
              IconButton(
                icon: const Icon(
                  Icons.calendar_today,
                  size: 30,
                ),
                color:
                    viewModel.currentIndex == 1 ? Colors.indigo : Colors.black,
                onPressed: () => viewModel.changePage(1),
              ),
              IconButton(
                icon: const Icon(
                  Icons.shopify,
                  size: 30,
                ),
                color:
                    viewModel.currentIndex == 2 ? Colors.indigo : Colors.black,
                onPressed: () => viewModel.changePage(2),
              ),
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  size: 30,
                ),
                color:
                    viewModel.currentIndex == 3 ? Colors.indigo : Colors.black,
                onPressed: () => viewModel.changePage(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
