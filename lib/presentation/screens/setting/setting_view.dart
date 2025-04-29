import 'package:flutter/material.dart';
import 'package:reco_is_here/presentation/screens/calender/calendar_event_custom_list_tile.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingView();
}

class _SettingView extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return CalenderEventCustomlisttile();
  }
}
