// import 'package:flutter/material.dart';
// import 'package:reco_is_here/data/models/video_card_model.dart';
// import 'package:reco_is_here/data/network/api_service.dart';

// class VideoTagProvider extends ChangeNotifier {
//   List<VideoCard> _allVideos = [];
//   List<VideoCard> _filteredVideos = [];
//   String _selectedTag = 'All';
//   bool _isLoadingMore = false;

//   List<VideoCard> get videos => _filteredVideos;
//   String get selectedTag => _selectedTag;
//   bool get isLoadingMore => _isLoadingMore;

//   Future<void> fetchVideos() async {
//     _allVideos = await ApiService().fetchVideoCards();
//     filterByTag(_selectedTag);
//   }

//   void filterByTag(String tag) {
//     _selectedTag = tag;
//     if (tag == 'All') {
//       _filteredVideos = _allVideos;
//     } else {
//       _filteredVideos =
//           _allVideos.where((video) => video.chanelsTags == tag).toList();
//     }
//     notifyListeners();
//   }

//   Future<void> loadMore() async {
//     if (_isLoadingMore) return;
//     _isLoadingMore = true;
//     notifyListeners();

//     // Simulate loading more (You could modify your API to support pagination)
//     await Future.delayed(const Duration(seconds: 2));
//     _isLoadingMore = false;
//     notifyListeners();
//   }
// }
import 'package:flutter/material.dart';
import 'package:reco_is_here/data/models/video_card_model.dart';
import 'package:reco_is_here/data/network/api_service.dart';

class VideoTagProvider extends ChangeNotifier {
  // Add these variables for pagination
  int _page = 1;
  final int _limit = 10;
  bool _hasMore = true;

  // Your existing variables
  List<VideoCard> _allVideos = [];
  List<VideoCard> _filteredVideos = [];
  String _selectedTag = 'All';
  bool _isLoadingMore = false;
  bool _isLoading = true;

  // Your existing getters
  List<VideoCard> get videos => _filteredVideos;
  String get selectedTag => _selectedTag;
  bool get isLoadingMore => _isLoadingMore;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;

  // Initial fetch
  Future<void> fetchVideos() async {
    _isLoading = true;
    _page = 1; // Reset to first page
    notifyListeners();

    try {
      // Modify your API service to accept pagination parameters
      _allVideos =
          await ApiService().fetchVideoCards(page: _page, limit: _limit);
      filterByTag(_selectedTag);
      _hasMore = _allVideos.length >=
          _limit; // If we got fewer than limit, we're at the end
    } catch (e) {
      print("Error fetching videos: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Your existing filter method
  void filterByTag(String tag) {
    _selectedTag = tag;

    if (tag == 'All') {
      _filteredVideos = List.from(_allVideos);
    } else {
      _filteredVideos = _allVideos.where((video) {
        final tags = video.chanelsTags.toLowerCase().split(',');
        return tags.any((t) => t.trim() == tag.toLowerCase());
      }).toList();
    }

    notifyListeners();
  }

  // Updated loadMore method that actually fetches more data
  Future<void> loadMore() async {
    if (_isLoadingMore || !_hasMore) return;

    _isLoadingMore = true;
    notifyListeners();

    try {
      _page++; // Increment the page
      final newVideos =
          await ApiService().fetchVideoCards(page: _page, limit: _limit);

      if (newVideos.isEmpty || newVideos.length < _limit) {
        _hasMore = false;
      }

      // Add new videos to our collection
      _allVideos.addAll(newVideos);

      // Reapply the current filter
      filterByTag(_selectedTag);
    } catch (e) {
      print("Error loading more videos: $e");
      _page--; // Revert page increment on error
    } finally {
      _isLoadingMore = false;
      notifyListeners();
    }
  }

  // Add a refresh method to get the latest data
  Future<void> refreshVideos() async {
    return fetchVideos(); // Reset and fetch from the beginning
  }
}
