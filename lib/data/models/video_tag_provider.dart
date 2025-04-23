import 'package:flutter/material.dart';
import 'package:reco_is_here/data/models/video_card_model.dart';
import 'package:reco_is_here/data/network/api_service.dart';

class VideoTagProvider extends ChangeNotifier {
  List<VideoCard> _allVideos = [];
  List<VideoCard> _filteredVideos = [];
  String _selectedTag = 'All';
  bool _isLoadingMore = false;

  List<VideoCard> get videos => _filteredVideos;
  String get selectedTag => _selectedTag;
  bool get isLoadingMore => _isLoadingMore;

  Future<void> fetchVideos() async {
    _allVideos = await ApiService().fetchVideoCards();
    filterByTag(_selectedTag);
  }

  void filterByTag(String tag) {
    _selectedTag = tag;
    if (tag == 'All') {
      _filteredVideos = _allVideos;
    } else {
      _filteredVideos =
          _allVideos.where((video) => video.chanelsTags == tag).toList();
    }
    notifyListeners();
  }

  Future<void> loadMore() async {
    if (_isLoadingMore) return;
    _isLoadingMore = true;
    notifyListeners();

    // Simulate loading more (You could modify your API to support pagination)
    await Future.delayed(const Duration(seconds: 2));
    _isLoadingMore = false;
    notifyListeners();
  }
}
