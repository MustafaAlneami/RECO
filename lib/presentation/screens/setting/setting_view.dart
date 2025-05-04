import 'package:flutter/material.dart';
import 'package:reco_is_here/presentation/screens/calender/calendar_event_custom_list_tile.dart';
import 'package:reco_is_here/presentation/screens/calender/test_calendar.dart';
import 'package:reco_is_here/presentation/screens/home/widgets/details_page/details_view.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingView();
}

class _SettingView extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return DetailsView();
  }
}
