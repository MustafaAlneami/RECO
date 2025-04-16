import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reco_is_here/presentation/screens/calender/calender_view.dart';
import 'package:reco_is_here/presentation/screens/home/home_view.dart';
import 'package:reco_is_here/presentation/screens/setting/setting_view.dart';
import 'main_view_model.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  final List<Widget> _pages = const [
    HomeView(),
    CalenderView(),
    SettingView(),
  ];

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MainViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('HOLA')),
      // body: IndexedStack(
      //   index: viewModel.currentIndex,
      //   children: _pages,
      // ),
      body: Consumer<MainViewModel>(builder: (context, mainViewModel, child) {
        return _pages[viewModel.currentIndex];
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: viewModel.currentIndex,
        onTap: viewModel.changePage,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black87,
        iconSize: 30,
        selectedFontSize: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: const IconThemeData(size: 40),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ' '),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ' '),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ' '),
        ],
      ),
    );
  }
}
